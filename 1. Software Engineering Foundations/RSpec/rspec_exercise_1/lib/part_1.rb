def average(arg1, arg2)
    (arg1 + arg2).to_f/2
end

def average_array(arr)
    arr.sum.to_f / arr.length
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    tab = str.downcase.split
    new_tab = []
    tab.map do |x|
        if tab.index(x) % 2 == 0
            new_tab << x.upcase
        else
            new_tab << x
        end
    end
    new_tab.join(" ")
end
