(* Week 2 Homework *)

(* Problem 1 *)
fun is_older(first_date: int*int*int, second_date: int*int*int) =
    if #1 first_date < #1 second_date then true
    else 
        if #1 first_date > #1 second_date then false
        else 
            if #1 first_date = #1 second_date
                then if #2 first_date < #2 second_date then true
                    else 
                        if #2 first_date > #2 second_date then false
                        else 
                            if #2 first_date = #2 second_date
                                then if #3 first_date > #3 second_date then false
                                    else true
                            else false
            else false

(* Problem 2 *)
fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates 
    then 0
    else 
        if #2 (hd dates) = month 
        then number_in_month(tl dates, month) + 1
        else number_in_month(tl dates, month)      

(* Problem 3 *)
fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* Problem 4 *)
fun dates_in_month(dates: (int*int*int) list, month: int) =
    if null dates
    then []
    else if #2 (hd dates) = month then (hd dates) :: dates_in_month(tl dates, month)
        else dates_in_month(tl dates, month)

(* Problem 5 *)
fun dates_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* Problem 6 *)
fun get_nth(strings: string list, n: int) =
    if null strings
    then hd strings
    else if n = 1 then hd strings   
        else get_nth(tl strings, n - 1)

(* Problem 7 *)
fun date_to_string(date: int*int*int) =
    let
    val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    val year = #1 date
    val month = #2 date
    val day = #3 date
    in
    get_nth(months, month) ^ " " ^ Int.toString(day) ^ ", " ^ Int.toString(year)
    end

(* Problem 8 *)
fun number_before_reaching_sum(sum: int, positive_number_list: int list) =
    let 
        val counter = 0
        val current_total = 0
        fun count(positive_number_list: int list, counter: int, current_total: int) =
            if hd positive_number_list + current_total >= sum then counter
            else count(tl positive_number_list, counter + 1, current_total + hd positive_number_list)
    in
        count(positive_number_list, counter, current_total)
    end