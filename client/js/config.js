angular.module('nibs.config', [])

    .constant('SERVER_URL', null)

    .constant('FB_APP_ID','714927388611590')

    .constant('STATUS_LABELS', [
        'Forastero',
        'Trinitario',
        'Criollo'
    ])

    .constant('STATUS_DESCRIPTIONS', [
        'フォラステロ(Forastero)は一般的かつチョコレートによく合うカカオ種です。Nibsのメンバーはこのフォラステロから育っていきます。',
        'トリニタリオ(Trinitario)はクリオロ豆のすぐれた味とフォラステロ豆を合わせたハイブリッドです。クリオロほど希少ではありませんが、非常に近いです。',
        'クリオロ(Criollo)は最も価値のある希少なカカオです。Nibsメンバーの中でも最高レベルの方はぜひその洗練された味わいのように貴重な存在です。'
    ]);
