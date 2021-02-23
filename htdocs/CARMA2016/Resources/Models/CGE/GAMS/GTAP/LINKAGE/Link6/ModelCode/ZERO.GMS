file count / 'zero.txt' /
put count ;

parameter nz ;

loop(t$(ord(t) eq 1 and Armflag eq 0),

   nz = sum(r,sum(i,sum(v,1$(and(r,i,v) eq 0)))) ;
   put 'ndeq;    ', nz  / ;
   put 'pndeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(v,1$(ae(r,i,v) eq 0)))) ;
   put 'xepeq;   ', nz  / ;
   put 'pepeq;   ', nz  / ;

   nz = sum(r, sum(i, sum(l,1$(ald(r,l,i) eq 0)))) ;
   put 'labdeq;  ', nz / ;

   nz = sum(r,sum(e,sum(j,sum(v,1$(aep(r,e,j,v) eq 0))))) ;
   put 'xapeq3;  ', nz  / ;

   nz = sum(r,sum(i,1$(axd(r,i) eq 0))) ;
   put 'xdeq;    ', nz  / ;

   nz = sum(r,sum(i,1$(axd(r,i) eq 0))) ;
   put 'pdeq2;   ', nz  / ;

   nz = sum(r,sum(i,1$(axe(r,i) eq 0))) ;
   put 'eseq;    ', nz  / ;

   nz = sum(r,sum(i,1$(axe(r,i) eq 0))) ;
   put 'ppeeq;   ', nz  / ;

   nz = sum(r,sum(rp,sum(i,1$(aew(r,rp,i) eq 0)))) ;
   put 'wpeeq;   ', nz  / ;

   nz = sum(r,sum(rp,sum(i,1$(aew(r,rp,i) eq 0)))) ;
   put 'wtfeq;   ', nz  / ;

   nz = sum(r,sum(i,1$(xmt0(r,i) eq 0))) ;
   put 'pmteq;   ', nz  / ;

   nz = sum(r,sum(i,1$(xmt0(r,i) eq 0))) ;
   put 'xmteq2;  ', nz  / ;

   nz = sum(h,sum(r,sum(i,1$(xac0(r,i,h) eq 0)))) ;
   put 'xaceq2;  ', nz  / ;

   nz = sum(r,sum(i,sum(f,1$(xaf0(r,i,f) eq 0)))) ;
   put 'xafeq;   ', nz  / ;

   nz = sum(r,sum(i,1$(amarg(r,i) eq 0))) ;
   put 'xmargeq; ', nz  / ;

) ;

loop(t$(ord(t) eq 1 and Armflag eq 1),

   nz = sum(r,sum(i,sum(v,1$(and(r,i,v) eq 0)))) ;
   put 'ndeq;    ', nz  / ;
   put 'pndeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(v,1$(ae(r,i,v) eq 0)))) ;
   put 'xepeq;   ', nz  / ;
   put 'pepeq;   ', nz  / ;

   nz = sum(r, sum(i, sum(l,1$(ald(r,l,i) eq 0)))) ;
   put 'labdeq;  ', nz / ;

   nz = sum(r,sum(e,sum(j,sum(v,1$(aep(r,e,j,v) eq 0))))) ;
   put 'xapeq2;  ', nz  / ;

   nz = sum(r,sum(i,sum(j,1$(apd(r,i,j) eq 0)))) ;
   put 'xdpeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(j,1$(apm(r,i,j) eq 0)))) ;
   put 'xmpeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(j,1$(xap0(r,i,j) eq 0)))) ;
   put 'papeq;   ', nz  / ;

   nz = sum(r,sum(i,1$(axd(r,i) eq 0))) ;
   put 'xdeq;    ', nz  / ;

   nz = sum(r,sum(i,1$(axd(r,i) eq 0))) ;
   put 'pdeq1;   ', nz  / ;

   nz = sum(r,sum(i,1$(axe(r,i) eq 0))) ;
   put 'eseq;    ', nz  / ;

   nz = sum(r,sum(i,1$(axe(r,i) eq 0))) ;
   put 'ppeeq;   ', nz  / ;

   nz = sum(r,sum(rp,sum(i,1$(aew(r,rp,i) eq 0)))) ;
   put 'wpeeq;   ', nz  / ;

   nz = sum(r,sum(rp,sum(i,1$(aew(r,rp,i) eq 0)))) ;
   put 'wtfeq;   ', nz  / ;

   nz = sum(r,sum(i,1$(xmt0(r,i) eq 0))) ;
   put 'pmteq;   ', nz  / ;

   nz = sum(r,sum(i,1$(xmt0(r,i) eq 0))) ;
   put 'xmteq1;  ', nz  / ;

   nz = sum(h,sum(r,sum(i,1$(xac0(r,i,h) eq 0)))) ;
   put 'paceq;   ', nz  / ;

   nz = sum(h,sum(r,sum(i,1$(xac0(r,i,h) eq 0)))) ;
   put 'xaceq1;  ', nz  / ;

   nz = sum(h,sum(r,sum(i,1$(acd(r,i,h) eq 0)))) ;
   put 'xdceq;   ', nz  / ;

   nz = sum(h,sum(r,sum(i,1$(acm(r,i,h) eq 0)))) ;
   put 'xmceq;   ', nz  / ;

   nz = sum(r,sum(i,sum(f,1$(xaf0(r,i,f) eq 0)))) ;
   put 'pafeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(f,1$(xaf0(r,i,f) eq 0)))) ;
   put 'xafeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(f,1$(afdd(r,i,f) eq 0)))) ;
   put 'xdfeq;   ', nz  / ;

   nz = sum(r,sum(i,sum(f,1$(afdm(r,i,f) eq 0)))) ;
   put 'xmfeq;   ', nz  / ;

   nz = sum(r,sum(i,1$(amarg(r,i) eq 0))) ;
   put 'xmargeq; ', nz  / ;

) ;
