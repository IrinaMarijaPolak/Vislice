% import random
% import model
% rebase ('base.tpl', title = 'Vislice')


  <h1>Vislice</h1>

  <blockquote>
    Vislice so najboljša igra za preganjanje dolgčasa (poleg tetrisa).
    <small>Študentje</small>
  </blockquote>

  <h2>{{igra.pravilni_del_gesla()}}</h2>

  Nepravilne črke : {{igra.nepravilni_ugibi()}} <br>

  % preostali_poskusi = model.STEVILO_DOVOLJENIH_NAPAK - igra.stevilo_napak() + 1
  Število preostalih poskusov: {{preostali_poskusi}}
  <img src="/img/{{igra.stevilo_napak() - 1}}.jpg" alt="obesanje">


% if poskus == model.ZMAGA:
 <h2> ZMAGA! </h2>

 <form action="/nova_igra/" method="post">
    <button type="submit">Nova igra</button>
  </form>

% elif poskus == model.PORAZ:

 <h2> Poraz! </h2>
 Pravilno geslo je {{igra.geslo}}

 <form action="/nova_igra/" method="post">
    <button type="submit">Nova igra</button>
  </form>

 % else:

 <form action="/igra/" method="post">
% tipkovnica = "QWERTZUIOPŠĐASDFGHJKLČĆŽYXCVBNM"
% for moja_crka in tipkovnica:
% if moja_crka not in igra.crke:
    <button type="submit", name="crka", value="{{moja_crka}}">{{moja_crka}}</button>
% end
% end


% preostale_crke = [x for x in tipkovnica if x not in igra.crke]
% nevem = random.choice(preostale_crke)
 <button type="submit", name="crka", value="{{nevem}}">?</button>

  </form>

 % end

