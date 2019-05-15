import model

lojtrice = "#############################################\n"

def izpis_zmage(igra):
    tekst = lojtrice + "uganili ste geslo {0}.\n".format(igra.geslo)
    return tekst

def izpis_poraza(igra):
    tekst = lojtrice + "Obešeni ste! Pravilno geslo je bilo {0}.\n".format(igra.geslo)
    return tekst

def izpis_igre(igra):
    tekst = (lojtrice + 
    igra.pravilni_del_gesla() + "\n" + 
    ("Preostalo število poskusov: {0}\nNapačni ugibi: {1}").format(model.STEVILO_DOVOLJENIH_NAPAK - igra.stevilo_napak() + 1, igra.nepravilni_ugibi()) + "\n" + lojtrice)
    return tekst

def zahtevaj_vnos():
    return input("Ugibaj črko: ")

def pozeni_vmesnik():
    igra = model.nova_igra()
    while True:
        #izpisemo stanje igre
        print(izpis_igre(igra))
        #zahtevaj vnos uporabnika
        poskus = zahtevaj_vnos()
        igra.ugibaj(poskus)
        #preveri če smo konclali
        if igra.poraz():
            print(izpis_poraza(igra))
            break
        elif igra.zmaga():
            print(izpis_zmage(igra))
            break
        else:
            pass
    return None

pozeni_vmesnik()

#igra = model.nova_igra()
#print(izpis_zmage(igra))
#print(izpis_poraza(igra))
#print(izpis_igre(igra))
