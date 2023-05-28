class SocioeconomicDataSource {
  String getSocioeconomicQuestions() {
    return '''
            [
              {
                "id": 1,
                "question": "Quantidade de automóveis de passeio exclusivamente para uso particular",
                "answers" : [
                  {
                    "id": 0,
                    "answer": "Não possui"
                  },
                  {
                    "id": 1,
                    "answer": "1 - Um"
                  },
                  {
                    "id": 2,
                    "answer": "2 - Dois"
                  },
                  {
                    "id": 3,
                    "answer": "3 - Três"
                  },
                  {
                    "id": 4,
                    "answer": "4 - Quatro ou mais"
                  }
                ]
              },
              {
                "id": 2,
                "question": "Quantidade de empregados mensalistas, considerando apenas os que trabalham pelo menos cinco dias por semana",
                "answers" : [
                  {
                    "id": 0,
                    "answer": "Não possui"
                  },
                  {
                    "id": 1,
                    "answer": "1 - Um"
                  },
                  {
                    "id": 2,
                    "answer": "2 - Dois"
                  },
                  {
                    "id": 3,
                    "answer": "3 - Três"
                  },
                  {
                    "id": 4,
                    "answer": "4 - Quatro ou mais"
                  }
                ]
              }
            ]
            ''';
  }
}
