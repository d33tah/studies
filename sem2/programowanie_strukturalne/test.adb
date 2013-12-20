with ada.text_io, ada.integer_text_io, ada.unchecked_deallocation;
use  ada.text_io, ada.integer_text_io;

pragma warnings(off);

procedure zaj5_1 is

    type stack;
    type stack_ptr is access stack;

    empty_stack: Exception;



    procedure push(v_stack: out stack_ptr; number: integer);
    procedure pop(v_stack: out stack_ptr; number: out integer);
    procedure print(v_stack: in stack_ptr);
    function size(v_stack: stack_ptr) return integer;
    procedure clean(v_stack: out stack_ptr);
    function copy(v_stack: stack_ptr) return stack_ptr;
    --function "="(v1_stack: stack_ptr; v2_stack: stack_ptr) return boolean;



    type stack is limited record
        prev: stack_ptr;
        number: integer;
    end record;


    procedure free is new ada.unchecked_deallocation(stack, stack_ptr);

    procedure push(v_stack: out stack_ptr; number: integer) is
        tmp: stack_ptr;
    begin
        tmp:=new stack;
        tmp.number:=number;
        if v_stack=null then
            v_stack:=tmp;
            return;
        end if;

        tmp.prev:=v_stack;
        v_stack:=tmp;
        return;
    end;

    procedure pop(v_stack: out stack_ptr; number: out integer) is
        tmp: stack_ptr;
    begin
        if v_stack=null then
            raise empty_stack;            
        end if;

        tmp:=v_stack;
        number:=v_stack.number;
        v_stack:=v_stack.prev;
        free(tmp);
        return;
    end;

    procedure print(v_stack: in stack_ptr) is
        tmp: stack_ptr:=v_stack;
    begin
        loop
            exit when tmp=null;
            put(tmp.number,0);
            new_line;
            tmp:=tmp.prev;
        end loop;
    end;

    function size(v_stack: stack_ptr) return integer is
        ret: integer:=0;
        tmp: stack_ptr:=v_stack;
    begin
        loop
            exit when tmp=null;
            ret:=ret+1;
            tmp:=tmp.prev;
        end loop;
        return ret;
    end;

    procedure clean(v_stack: out stack_ptr) is
        tmp: integer;
    begin
        loop
            exit when v_stack=null;
            pop(v_stack,tmp);
        end loop;
    end;

    function copy(v_stack: stack_ptr) return stack_ptr is
        v_size: integer:=size(v_stack);
        tmp: stack_ptr;
        ret: stack_ptr;
    begin
        for i1 in  1..v_size loop
            tmp:=v_stack;
            for i2 in reverse (i1+1)..v_size loop
                tmp:=tmp.prev;
            end loop;
            push(ret,tmp.number);
        end loop;
        return ret;
    end;

    function "="(v1_stack: stack_ptr; v2_stack: stack_ptr) return boolean is
        tmp1: stack_ptr:=v1_stack;
        tmp2: stack_ptr:=v2_stack;
    begin

        if(size(v1_stack)/=size(v2_stack)) then
            return false;
        end if;

        if(size(v1_stack)=0 and size(v2_stack)=0) then
            return true;
        end if;

        loop
            exit when tmp1=null;
            if (tmp1.number/=tmp2.number) then
                return false;
            end if;

            tmp1:=tmp1.prev;
            tmp2:=tmp2.prev;
        end loop;
        return true;

    end;

    one: stack_ptr;
    two: stack_ptr;
    number: integer;
    choice: integer;
begin
    loop
        put_line("1: Push to the stack one");
        put_line("2: Pop off the stack one");
        put_line("3: Print the stack one");
        put_line("4: Output the size of stack one");
        put_line("5: Clean the stack one");
        put_line("6: Copy from stack one to two");
        put_line("7: Print the stack two");
        put_line("8: Compare the two stacks");
        put_line("9: Push to stack two");
        put_line("0: Exit");
        put("Your choice: ");
        get(choice);
        case choice is
            when 1=>
                put("Enter the number: "); 
                get(number); 
                push(one,number);
            when 2=>
                begin
                    pop(one,number);
                    put("Popped the number: ");
                    put(number,0);
                    put_line(".");
                exception
                    when empty_stack=>
                        put_line("Error: the stack is empty.");
                end;
            when 3=>
                print(one);
            when 4=>
                put("The size of stack one: ");
                put(size(one),0);
                put_line(".");
            when 5=>
                clean(one);
            when 6=>
                two:=copy(one);
            when 7=>
                print(two);
            when 8=>
                if(one=two) then
                    put_line("They're equal.");
                else
                    put_line("They're not equal.");
                end if;
            when 9=>
                put("Enter the number: "); 
                get(number); 
                push(two,number);
            when 0=>
                exit;
            when others=>put_line("Error: incorrect choice.");
        end case;
    end loop;
end;