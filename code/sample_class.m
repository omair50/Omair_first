



classdef sample_class < handle
    
    properties (GetAccess = 'public', SetAccess = 'private')
            N = 0:.1:1; 
            f = 5;
            Fs = 10;
            
    end

    methods 

        function obj = sample_class(N,f,Fs)  %constructor
           
            if(nargin > 0)
                
            obj.N = N;
            obj.f = f;
            obj.Fs = Fs;
            
            end
        end
    end

    methods
        function obj = data(obj)
        t = (obj.N)*(1/obj.Fs);
        sin_function = sin(2*pi*obj.f*t);
        plot (t,sin_function);
        end
   end
end