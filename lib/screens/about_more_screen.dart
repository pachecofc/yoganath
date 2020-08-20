import 'package:flutter/material.dart';
import 'package:yoganath/utilities/buildNavigationBar.dart';
import 'package:yoganath/widgets/reusableMidiaCard.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class AboutMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String biography = 'A minha experiência pessoal me mostrou que a '
        'prática de yoga depois de ocidentalizada perdeu muito da essência '
        'desse ensinamento tão valioso, e fez com que as pessoas entendessem '
        'que yoga se resume à prática de asana, desestimulando os menos '
        'flexíveis. Para você me conhecer melhor, vou te contar um pouco da '
        'minha trajetória: O yoga faz parte da minha vida desde criança. Na '
        'verdade, o yoga faz parte da vida de todos quando crianças. O yoga '
        'intuitivo está registrado na ancestralidade do ser humano há '
        'milênios. O sistema social, a nossa forma de viver, é que acaba nos '
        'distanciando desse conhecimento. Desde pequena observo as reações do '
        'meu corpo físico frente as situações, coloco ele à prova,  observo ‘de '
        'fora’. É um conhecimento muito profundo para ser entendido por uma '
        'criança, tudo sempre foi feito pela mais pura curiosidade. Com um '
        'tempo, a sociedade foi me cobrando outras respostas e a pressão por '
        '‘ser alguém’ dentro do sistema me afastou do hábito yogi. O mais '
        'engraçado é que a chama da auto-investigação nunca se apagou, vez por '
        'outra eu me pegava testando os exercícios respiratórios, mesmo sem '
        'conhecer nada sobre eles. Construí uma carreira dentro do mundo '
        'econômico corporativo, formada em Comércio Exterior com MBA em '
        'Gestão Estratégica, quando decidi que essa não era a estrada que eu '
        'queria seguir. Tinha algo mais forte dentro de mim que pedia que eu '
        'continuasse com a auto-investigação sobre “quem sou eu” além desse '
        'corpo-mente. O meu primeiro contato com uma aula prática de yoga foi '
        'em 1999, fui com minha irmã experimentar o hatha yoga, eu tinha 10 '
        'anos e confesso que não me interessei. Eu nunca fui flexível e uma '
        'criança com muito vigor. O modelo de aula ocidental não atrai perfil '
        'de uma criança como eu fui.. rsrs.. Alí eu não tinha a menor ideia de '
        'que toda aquela auto-investigação que eu gostava de fazer tinha alguma '
        'coisa a ver com o yoga. Minha segunda tentativa foi em 2005. Algo '
        'gritou em mim “vai praticar yoga”, e eu chamei uma amiga da escola '
        'pra fazer uma aula experimental em um clube, assim uma incentivava a '
        'outra.. mas também não foi promissor. E eu lembro que, meu maior '
        'obstáculo sempre foi a questão da flexibilidade. Vários anos se '
        'passaram até eu sentir esse chamado novamente.. e na terceira vez, '
        'não teve erro, o universo providenciou uma professora maravilhosa '
        'que, além da prática física também ensinava a essência teórica do '
        'yoga, e eu, nesse momento, já tinha maturidade suficiente para '
        'entender a profundidade dos ensinamentos; me apaixonei, me entreguei '
        'para essa Filosofia; e, mesmo ainda sem flexibilidade alguma, resolvi '
        'insistir, persistir e não desistir. Até que resolvi iniciar o curso '
        'de formação para Professores de Yoga, atendendo outra grande paixão '
        'minha que é ensinar. Quase que para compensar as vezes que desisti, '
        'fiz 3 formações diferentes. :)  2 presenciais na minha cidade e um '
        'semi-presencial. Eu queria aprender as diferentes abordagens, em '
        'diferentes pontos de vista. Assim, me sinto completamente segura em '
        'repassar esse conhecimento, tão profundo e intrínseco em todo ser '
        'humano. O conhecimento do yoga precisa ser reavivado dentro de cada '
        'pessoa. Ele ajuda a enfrentar as adversidades da vida, ajuda a sair '
        'da roda do sofrimento criado pela mente humana desde a formação da '
        'sociedade. Ele é um direito de todos aqueles que estão passando por '
        'essa experiência humana. Dentro do conhecimento do yoga você '
        'encontra ensinamentos valiosos que te ajudam a desfrutar da vida da '
        'forma mais leve e prazerosa possível. Vamos juntos?';
    final pageBody = SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ReusableMidiaCard(
                  imageName: 'sobre_Nath.png', isChecked: false),
            ),
            Material(child: Text(biography)),
          ],
        ),
      ),
    );
    const Text appBarTitle = Text('Conheça a Nath');

    return SafeArea(
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: buildCupertinoNavigationBar(context, appBarTitle),
              child: pageBody,
            )
          : Scaffold(
              appBar: AppBar(title: appBarTitle),
              body: pageBody,
            ),
    );
  }
}
