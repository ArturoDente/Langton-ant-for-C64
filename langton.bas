0 gosub 7000
4 gosub 500
9 poke 53281,4:poke53280,4 
30 dr%=0:rem 0,1,2,3 per su,destra,giu,sinistra
40 x%=20:y%=12
50 c=peek(55296+x%+(40*y%))
60 c=c-int(c/16)*16
70 if c=0 then dr%=fn rl(dr%)
80 if c=1 then dr%=fn rr(dr%)
90 gosub 200
100 goto 50
200 rem update posizione
210 rem 1) cambio colore cella e carattere
220 nc=-1*(c=0)
230 poke 55296+x%+(40*y%),nc
235 poke 1024+x%+(40*y%),102
240 rem 2) sposto la formica
250 if dr%=1 or dr%=3 then x%=x%-(dr%=1)+(dr%=3)
260 if dr%=0 or dr%=2 then y%=y%+(dr%=0)-(dr%=2)
270 if x%<0 then x%=0:dr%=1
280 if x%>39 then x%=39:dr%=3
290 if y%<0 then y%=0:dr%=2
295 if y%>24 then y%=24:dr%=0
300 return
500 rem intro screen 
501 print "{clear}{white}               langton ant":poke53281,0:poke53280,0
510 print "========================================"
520 print"press f1 for a white field{return}"
530 print"press f3 for a random field"
540 print "========================================"
550 print "by arturo dente"
560 get a$:if a$="" then 560
570 if a$="{f3}" then sys sa:return
580 if a$="{f1}" then sys 49178:return
590 goto 560
6999 end
7000 rem crea la mappa tramite lm
7002 sa = 49152
7004 for n = 0 to 74
7006 read a% : poke sa+n,a%: next n
7012 data 32,26,192,160,0,32,62,192
7014 data 153,0,216,153,250,216,153,244
7016 data 217,153,238,218,200,192,250,208
7018 data 236,96,160,0,169,160,153,0
7020 data 4,153,250,4,153,244,5,153
7022 data 238,6,169,1,153,0,216,153
7024 data 250,216,153,244,217,153,238,218
7026 data 200,192,250,208,223,96,173,4
7028 data 220,201,128,176,3,169,0,96
7030 data 169,1,96
7036 rem def funzioni
7046 def fn rl(n)=-(n=0)*3-(n>0)*(n-1)
7056 def fn rr(n)=-(n<3)*(n+1)
7200 return 