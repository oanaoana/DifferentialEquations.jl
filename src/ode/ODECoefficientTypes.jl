type ExplicitRK
  A::Array{Float64,2}
  c::Vector{Float64}
  α::Vector{Float64}
  αEEst::Vector{Float64}
  stages::Int
  order::Int
  ExplicitRK(A,c,α,order;αEEst=Float64[]) = new(A,c,α,αEEst,length(α),order)
end

Base.length(tab::ExplicitRK) = tab.stages

function constructHuen()
  A = [0 0
       1 0]
  c = [0;1]
  α = [1/2;1/2]
  αEEst = [1;0]
  return(ExplicitRK(A,c,α,2,αEEst=αEEst))
end

function constructRalston()
  A = [0 0
       2/3 0]
  c = [0;2/3]
  α = [1/4;3/4]
  return(ExplicitRK(A,c,α,2))
end

function constructRKF()
  A = [0 0 0 0 0 0
      1/4 0 0 0 0 0
      3/32 9/32 0 0 0 0
      1932/2197 -7200/2197 7296/2197 0 0 0
      439/216 -8 3680/513 -845/4104 0 0
      -8/27 2 -3544/2565 1859/4104 -11/40 0]
  c = [0;1/4;3/8;12/13;1;1/2]
  α = [16/135;0;6656/12825;28561/56430;-9/50;2/55]
  αEEst = [25/216;0;1408/2565;2197/4104;-1/5;0]
  return(ExplicitRK(A,c,α,5,αEEst=αEEst))
end

function constructBogakiShampine()
  A = [0 0 0 0
      1/2 0 0 0
      0 3/4 0 0
      2/9 1/3 4/9 0]
  c = [0,1/2,3/4,1]
  α = [2/9;1/3;4/9;0]
  αEEst = [7/24;1/4;1/3;1/8]
  return(ExplicitRK(A,c,α,3,αEEst=αEEst))
end

function constructCashKarp()
  A = [0 0 0 0 0 0
       1/5 0 0 0 0 0
       3/40 9/40 0 0 0 0
       3/10 -9/10 6/5 0 0 0
       -11/54 5/2 -70/27 35/27 0 0
       1631/55296 175/512 575/13824 44275/110592 253/4096 0]
  c = [0;1/5;3/10;3/5;1;7/8]
  α = [37/378;0;250/621;125/594;0;512/1771]
  αEEst = [2825/27648;0;18574/48384;13525/554296;277/14336;1/4]
  return(ExplicitRK(A,c,α,5,αEEst=αEEst))
end

function constructDormandPrince()
  A = [0 0 0 0 0 0 0
      1/5 0 0 0 0 0 0
      3/40 9/40 0 0 0 0 0
      44/45 -56/15 32/9 0 0 0 0
      19372/6561 -25360/2187 64448/6561 -212/729 0 0 0
      9017/3168 -355/33 46732/5247 49/176 -5103/18656 0 0
      35/384 0 500/1113 125/192 -2187/6784 11/84 0]
  c = [0;1/5;3/10;4/5;8/9;1;1]
  α = [35/384;0;500/1113;125/192;-2187/6784;11/84;0]
  αEEst = [5179/57600;0;7571/16695;393/640;-92097/339200;187/2100;1/40]
  return(ExplicitRK(A,c,α,5,αEEst=αEEst))
end

function constructRKF8()
  A =[0 0 0 0 0 0 0 0 0 0 0 0 0
      2/27 0 0 0 0 0 0 0 0 0 0 0 0
      1/36 1/12 0 0 0 0 0 0 0 0 0 0 0
      1/24 0 1/8 0 0 0 0 0 0 0 0 0 0
      5/12 0 -25/16 25/16 0 0 0 0 0 0 0 0 0
      1/20 0 0 1/4 1/5 0 0 0 0 0 0 0 0
      -25/108 0 0 125/108 -65/27 125/54 0 0 0 0 0 0 0
      31/300 0 0 0 61/225 -2//9 13/900 0 0 0 0 0 0
      2 0 0 -53/6 704/45 -107/9 67/90 3 0 0 0 0 0
      -91/108 0 0 23/108 -976/135 311/54 -19/60 17/6 -1/12 0 0 0 0
      2383/4100 0 0 -341/164 4496/1025 -301/82 2133/4100 45/82 45/164 18/41 0 0 0
      3/205 0 0 0 0 -6/41 -3/205 -3/41 3/41 6/41 0 0 0
     -1777/4100 0 0 -341/164 4496/1025 -289/82 2193/4100 51/82 33/164 12/41 0 1 0]
    α = [41/840;0;0;0;0;34/105;9/35;9/35;9/280;9/280;41/840;0;0]
    αEEst = [0;0;0;0;0;34/105;9/35;9/35;9/280;9/280;0;41/840;41/840]
    c = [0;2/27;1/9;1/6;5/12;1/2;5/6;1/6;2/3;1/3;1;0;1]
  return(ExplicitRK(A,c,α,8,αEEst=αEEst))
end

DEFAULT_TABLEAU = constructDormandPrince()
