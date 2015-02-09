CREATE TABLE IF NOT EXISTS tokens (
    userId           BIGSERIAL,
    externalUserId   TEXT,
    token            TEXT NOT NULL UNIQUE,
    created          TIMESTAMP DEFAULT now()
  );

CREATE TABLE IF NOT EXISTS wallet (
    userId       BIGINT,
    offerId      BIGINT
  );

CREATE TABLE IF NOT EXISTS wishlist (
    userId       BIGINT,
    productId    BIGINT
  );

CREATE TABLE IF NOT EXISTS picture (
    id           BIGSERIAL,
    userId       BIGINT,
    url          TEXT,
    publishDate  timestamp default current_timestamp
  );



CREATE SCHEMA IF NOT EXISTS salesforce;

CREATE TABLE IF NOT EXISTS salesforce.contact (
    id              BIGSERIAL,
    firstName       TEXT,
    lastName        TEXT,
    email           TEXT,
    mobilePhone     TEXT,
    leadsource      TEXT,
    accountid       TEXT,
    pictureURL__c   TEXT,
    preference__c   TEXT,
    size__c         TEXT,
    loyaltyid__c    TEXT,
    password__c     TEXT,
    createddate     timestamp
  );

CREATE TABLE IF NOT EXISTS salesforce.interaction__c (
    id                      BIGSERIAL,
    contact__loyaltyid__c   TEXT,
    campaign__c             TEXT,
    product__c              TEXT,
    type__c                 TEXT,
    name__c                 TEXT,
    picture__c              TEXT,
    points__c               double precision,
    createddate             timestamp
  );

DROP TABLE IF EXISTS salesforce.campaign;
CREATE TABLE IF NOT EXISTS salesforce.campaign (
    id              BIGSERIAL PRIMARY KEY,
    sfId            TEXT,
    name            TEXT,
    startdate       DATE,
    enddate         DATE,
    description     TEXT,
    image__c        TEXT,
    campaignpage__c TEXT,
    publishdate__c  DATE,
    type            TEXT,
    status          TEXT
  );

DROP TABLE IF EXISTS salesforce.product2;
CREATE TABLE IF NOT EXISTS salesforce.product2 (
    id              BIGSERIAL PRIMARY KEY,
    name            TEXT,
    description     TEXT,
    image__c        TEXT,
    productpage__c  TEXT,
    publishdate__c  DATE
  );

DROP TABLE IF EXISTS salesforce.store__c;
CREATE TABLE IF NOT EXISTS salesforce.store__c (
    id                      BIGSERIAL PRIMARY KEY,
    name                    TEXT,
    location__latitude__s   TEXT,
    location__longitude__s  TEXT
  );

INSERT INTO salesforce.campaign (id, name, description, image__c, type, status) VALUES
    (1, 'チョコレートスタウトが1000円オフ！', '超おすすめのチョコレートスタウトを1000円オフでお試しください', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/chocolate_camarao.jpeg', 'Offer', 'In Progress'),
    (2, '２回目のご注文は10%オフ', '２回目はさらにお得！', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/truffles.jpg', 'Offer', 'In Progress'),
    (3, '10% off EcoChocolate: Fair Trade and Organic Chocolates', '0% off chocolate that makes you feel as good as they tastes! Fair Trade and Organic chocolates assortment...', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/ritual2.jpg', 'Offer', 'In Progress'),
    (4, '２個お買い上げで１個無料！ダンデライオンBuy 2 Get 1 Free: Dandelion Chocolate for Connoisseurs', 'Purists, Foodies and Afficionados: Buy 2 Bars Get 1 Free', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/Purists+Campaign+.png', 'Offer', 'In Progress'),
    (5, '４個お買い上げで２個無料！サンフランシスコで一番人気の商品をお試しください', 'Buy 4, get 6 of of the city''s finest native chocolatiers, old and new: Tcho, Dandelion, Recchiutti, Ghirardelli, Sharffenburger, Guittard.', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/Best+of+San+Francisco+Campaign.png', 'Offer', 'In Progress'),
    (6, '母の日は送料無料', 'Free Shipping for all Mother’s Day gifts places >72 hours before Sunday, May 11', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/soma1.jpg', 'Offer', 'In Progress'),
    (7, 'ワインと一緒にご注文で送料無料', 'Free Shipping on all wine, champagne, and chocolate pairings.', 'https://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/dandelion2.jpg', 'Offer', 'In Progress'),
    (8, 'ナッツ＆ナッツ30%1000円オフ！ミックスチョコでコーティングしたナッツをお届け', 'Are you nuts for nuts?', 'http://s3-us-west-1.amazonaws.com/sfdc-demo/nibs/nuts.jpg', 'Offer', 'In Progress');

INSERT INTO salesforce.product2 (id, name, description, image__c) VALUES
    (1, 'キャラメルアーモンド', 'Addictive treats from the popular new boutique chocolatier in San Francisco''s Mission District.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/feve1.jpg'),
    (2, 'チョコレートスタウト', 'For the chocolate tilted beer lover, as chocolate stout that is sure to refresh.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/chocolate_camarao.jpeg'),
    (3, 'ダンデライオン詰合せ', 'Bring the flavor of San Francisco boutique chocolate into your home, or present as a gift to the foodie in your life.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/dandelion2.jpg'),
    (4, 'ダンデライオンの小袋', 'Experience the buzz around San Francisco''s newest boutique chocolatier. These beans are slow roasted whole for unparalleled flavor depth.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/dandelion1.jpg'),
    (5, 'マッツォクランチ', 'A uniquely crunchy treat. So good we had to offer it all year round.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/matzo.jpg'),
    (6, 'パトリック IN-NIB-ITABLE', 'For the Nibs lovers in your life: a bar of 72% cacao, dark, sweet and strewn with crunchy nibs.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/patric2.jpg'),
    (7, 'パトリック限定版', 'Salt and chocolate meet in a single bar. For sophisticated palettes.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/patric3.jpg'),
    (8, 'パトリック・ミッツ・オー・クランチ', 'Some love smooth, some love crunch. This is a crunch! Lively on the palette.', 'https://sfdcj-demo.s3-ap-northeast-1.amazonaws.com/nibs/patric1.jpg');

INSERT INTO salesforce.store__c (id, name, location__latitude__s, location__longitude__s) VALUES
    (1, '目黒雅叙園店', 35.683013, 139.683064),
    (2, '虎ノ門ヒルズ店', 35.666868, 139.749562),
    (3, '丸の内KITTE店', 35.6798, 139.764877),
    (4, '大阪梅田店', 34.698401, 135.492705);
/*
    (1, 'マーキス', 37.785143, -122.403405),
    (2, 'ヒルトン', 37.786164, -122.410137),
    (3, 'ハイアット', 37.794157, -122.396311)
*/
