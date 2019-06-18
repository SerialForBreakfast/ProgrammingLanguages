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