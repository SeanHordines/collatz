with Ada.Text_IO, Ada.Long_Integer_Text_IO, Ada.Containers, Ada.Containers.Vectors;
use Ada.Containers;

procedure recur is
    n, l, temp : Long_Integer;

    type Tuple is array(1..2) of Long_Integer;
    package BetterVectors is new Ada.Containers.Vectors(Index_Type => Natural, Element_Type => Tuple);
    use BetterVectors;

    function c1(a, b : Tuple) return Boolean is
    begin
        if a(2) = b(2) then
            return (a(1) > b(1));
        else
            return (a(2) < b(2));
        end if;
    end c1;
    package VectorSorting is new BetterVectors.Generic_Sorting(c1);

    largest : Vector;

    function getSeqLen (num: Long_Integer) return Long_Integer is
        n : Long_Integer;
    begin
        n := num;

        if n = 1 then
            return 0;
        else
            if n mod 2 = 0 then
                return getSeqLen(n/2) + 1;
            else
                return getSeqLen((3*n) + 1) + 1;
            end if;
        end if;
    end getSeqLen;
begin
    Ada.Text_IO.Put("Enter the upper bound: ");
    Ada.Long_Integer_Text_IO.Get(n);

    largest.Append((1, 0));

    for i in 1 .. n loop
        l := getSeqLen(i);
        temp := Element(largest, 0)(2);

        if l > temp then
            if Length(largest) >= 10 then
                Replace_Element(largest, 0, (i, l));
            else
                largest.Append((i, l));
            end if;
            VectorSorting.Sort(largest);
        end if;
    end loop;

    Reverse_Elements(largest);

    for i in largest.First_Index .. largest.Last_Index loop
        Ada.Text_IO.Put(Long_Integer'Image (largest.Element(i)(1)));
        Ada.Text_IO.Put_Line(Long_Integer'Image (largest.Element(i)(2)));
    end loop;

end recur;
