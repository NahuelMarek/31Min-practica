% Aquí va el código.
cancion(bailanSinCesar, [pabloIlabaca, rodrigoSalinas], 10600177).
cancion(yoOpino, [alvaroDiaz, carlosEspinoza, rodrigoSalinas], 5209110).
cancion(equilibrioEspiritual, [danielCastro, alvaroDiaz, pabloIlabaca, pedroPeirano, rodrigoSalinas], 12052254).
cancion(tangananicaTanganana, [danielCastro, pabloIlabaca, pedroPeirano], 5516191).
cancion(dienteBlanco, [danielCastro, pabloIlabaca, pedroPeirano], 5872927). 
cancion(lala, [pabloIlabaca, pedroPeirano], 5100530).

rankingTop3(febrero, 1, lala).
rankingTop3(febrero, 2, tangananicaTanganana).
rankingTop3(febrero, 3, meCortaronMalElPelo).
rankingTop3(marzo, 1, meCortaronMalElPelo).
rankingTop3(marzo, 2, tangananicaTanganana).
rankingTop3(marzo, 3, lala).
rankingTop3(abril, 1, tangananicaTanganana).
rankingTop3(abril, 2, dienteBlanco).
rankingTop3(abril, 3, equilibrioEspiritual).
rankingTop3(mayo, 1, meCortaronMalElPelo).
rankingTop3(mayo, 2, dienteBlanco).
rankingTop3(mayo, 3, equilibrioEspiritual).
rankingTop3(junio, 1, dienteBlanco).
rankingTop3(junio, 2, tangananicaTanganana).
rankingTop3(junio, 3, lala).

hit(Cancion):-
    cancion(Cancion,_,_),
    forall(rankingTop3(Mes,_,_),rankingTop3(Mes,_,Cancion)).

hit2(Cancion):-
    cancion(Cancion,_,_),
    not(noExisteEnElMes(Cancion,_)).

noExisteEnElMes(Cancion,Mes):-
    cancion(Cancion,_,_),
    rankingTop3(Mes,_,_),
    not(rankingTop3(Mes,_,Cancion)).

noReconocidaPorLosCriticos(Cancion):-
    cancion(Cancion,_,_),
    tuvoMuchasReproducciones(Cancion),
    not(rankingTop3(_,_,Cancion)).

tuvoMuchasReproducciones(Cancion):-
    cancion(Cancion,_,Reproducciones),
    Reproducciones>7000000.

colaboradores(Compositor, OtroCompositor):-
    cancion(_,Compositores,_),
    member(Compositor,Compositores),
    member(OtroCompositor,Compositores),
    Compositor\=OtroCompositor.

conductor(tulio,5).
conductor(juanin,0).
periodista(bodoque,2,licenciatura).
periodista(mario_hugo,10,posgrado).
reportero(bodoque,10,300).

persona(tulio).
persona(juanin).
persona(bodoque).
persona(mario_hugo).

sueldoTotal(Persona, Total):-
    persona(Persona),
    findall(Sueldo, sueldoPorTrabajo(Persona,_,Sueldo), Sueldos),
    sumlist(Sueldos,Total).

sueldoPorTrabajo(Persona,conductor, Sueldo):-
    conductor(Persona,Anios),
    Sueldo is Anios * 10000.

sueldoPorTrabajo(Persona,reportero, Sueldo):-
    reportero(Persona,Anios,Notas),
    Sueldo is (Anios*10000) + (100*Notas).

sueldoPorTrabajo(Persona,periodista, Sueldo):-
    periodista(Persona,Anios,Titulo),
    incremento(Titulo, Incremento),
    Sueldo is Anios * 5000 * Incremento.

incremento(licenciatura,1.20).
incremento(posgrado,1.35).