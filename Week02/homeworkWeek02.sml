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


fun number_in_month(dates: (int*int*int) list, month: int) =
    if null dates 
    then 0
    else 
        if #2 (hd dates) = month 
        then number_in_month(tl dates, month) + 1
        else number_in_month(tl dates, month)      
        


fun number_in_months(dates: (int*int*int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

