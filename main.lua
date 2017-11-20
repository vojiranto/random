function new.Random ()
    local public = {}
    -- [0, x]
    public.log = function (x)
        return x - round (math.log(math.random (1, 2^x), 2))
    end


    -- [-x, x]
    public.logR = function (x, b)
        local logD = function (x, b)
            return x - 1 - round (math.log(math.random (1, b^x - 1 - b^(x-b)), b))
        end

        b = b or 2
        if math.random() < 0.5 then
            return -logD (x, b)
        else
            return  logD (x, b)
    end end


    public.shiftNumber = function (v, b)
        b = b or 2
        return v + public.logR (v, b)
    end

    -- распределение вероятностей по таблице.
    public.discrete = function (x)
        local r, l = math.random(), 0

        for k, v in pairs (x) do
            l = l + v
            if r < l then
                return k
    end end end
    
    public.init = function ()
        math.randomseed(os.time())
    end

    return copy(public)
end
