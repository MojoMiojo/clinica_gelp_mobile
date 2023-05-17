class SocioeconomicDataSource {
  String getSocioeconomicQuestions() {
    return '''
            [
              {
                "id": 1,
                "question": "Quantidade de automóveis de passeio exclusivamente para uso particular"
              },
              {
                "id": 2,
                "question": "Quantidade de empregados mensalistas, considerando apenas os que trabalham pelo menos cinco dias por semana"
              }
            ]
            ''';
  }
}
