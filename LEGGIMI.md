# Bitcoin RPM from Community Signed Binaries

I pacchetti rpm compilati reperibili in giro sono:
* [Ringing Liberty](https://www.ringingliberty.com/bitcoin/)
* [Cheese](http://www.nosuchhost.net/~cheese/fedora/packages/29/SRPMS/bitcoin.html)
* [AltLinux](https://altlinux.pkgs.org/sisyphus/classic-x86_64/bitcoin-0.17.1-alt1.x86_64.rpm.html)

Solo il pacchetto Ringing Liberty è pensato per RHEL/CentOS. Tuttavia i binari in esso inclusi sono compilati e firmati solo dall'autore del pacchetto.

Esiste invece un tar dei binari compilati e firmati dalla community degli sviluppatori usando un metodo deterministico (gitians) che consente di ottenere sempre binari identici. In questo modo più persone compilano sulla propria macchina e firmano il binario ottenuto, [pubblicando la propria firma](https://github.com/bitcoin-core/gitian.sigs).

Per non perdere il livello di sicurezza del metodo gitians, in attesa che il team dibitcoin core integri la creazione di un rpm firmato con gitians, è sufficiente creare il pacchetto rpm con un file spec che parta dal [tar dei binari firmati](https://bitcoincore.org/en/download/).

Il file spec utilizzato è una versione modificata di quello distribuito da Ringing Liberty per la versione 0.17.1-1 dal quale è stata solamente rimossa la parte di build, sostituendola con il download del tar contenente i file binari.

Lo script build.sh consente di generare il pacchetto rpm su una macchina centos7 a partire dal file spec e dai file di corredo del pacchetto (script di start/stop del servizio, configurazione SELinux, qualche file di documentazione).
