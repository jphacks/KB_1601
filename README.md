# Smart Finance
## あなたの"財政状況"と"必要資金"の情報を集計し、資金を調達するためのヒントを提供するアプリです。
### Fin-Tech

### 背景（製品開発のきっかけ、課題等）
現在日本は非常に子育ての難しい国となりつつあります。その原因の一つには貧困が挙げられます<br>日本では子育てをするのに十分な経済力がないという理由で一年に340,000件もの流産が発生しています。またシングルマザーのうち1/3が貧困と戦っています。<br>
また子育て以外の場においても、大きな出費を控えようとする傾向が若者を中心に広がりつつあります。ですがこれらの問題にはお金の取り回しについて適切なアドバイスを受けることができれば解決出来るケースが多く存在するのもまた事実です。<br>
そこで私たちは自分の"財政状況"や"必要資金"といった情報を元に資金調達のためのヒントを提供するアプリケーションを開発しようと考えました。<br>



### 製品説明（具体的な製品の説明）
1.初めに自分の収入や株などの資本、若しくは借金の情報を入力します。<br>
ここでは自分の資本をJob,Asset,Debtの3つのカテゴリに分類し、できるだけ詳細に入力してください。<br>
各カテゴリにて入力する項目は以下のようになります。<br><br>
**Job**--名前、収入、収入頻度(ex. 教師,¥200000,月収)<br>
**Asset**--名前、金額、利子、収入時期(ex. ABC社株、¥1500000、5%、年毎)<br>
**Debt**--名前、金額、利子、返済額、返済頻度(ex. XYZ金融、¥300000、2%、¥100000、月毎)<br>
<br>
<br>
2.次にあなたが購入したいものについての情報を入力してください。<br>
必要な項目は以下のようになります。<br><br>
**名前**(ex. 車)<br>
**金額**(ex. ¥1000000)<br>
**支払い回数**(ex. 一括or分割、分割の場合は何回払いか？利息はどのくらいつくか？)<br>
**購入希望時期**(ex. 今すぐ)<br>
<br>
<br>
3.診断結果が返ってきます。<br>
結果には以下の項目が表示されます。<br><br>
**現在の自己資本** <br>
**必要資金** <br>
**アドバイス** <br>


### 特長
####1. iOS(Swift)とAndroid(Java)両方のデバイスに向けて開発を行った
####2. XigniteAPIを用いて高度な分析を行う(予定)

### 解決出来ること
自分が現在どのくらいの資産を持っていて、どのくらいの資金を必要としているのかが明確にわかります。子育てやローンなど長期的な資金援助が必要な場合でも様々な解決の糸口をサジェストしてくれます。(予定)

### 今後の展望
【ユーザビリティの向上】<br>
ユーザによっては入力項目が非常に多くなってしまうため、ユーザビリティの向上を目指したい<br>
複雑な入力項目をどれだけ使いやすく美しいUIにまとめ上げるかが改善点<br>
【解析ロジックの高度化】<br>
より適切なアドバイスを提供できるよう、さらに多くのAPIや経済学的なアルゴリズムを試したい(XigniteAPIの実装)

### 注力したこと（こだわり等）
* AndrodとiOS両方での実装を行った
* It was hard to find a free fintech API that integrated with mobile applications

## 開発技術
### 活用した外部技術
#### API・データ
* https://poi.apache.org/apidocs/org/apache/poi/ss/formula/functions/FinanceLib.html
* http://xignite.github.io/JavaSDK/
* https://github.com/kulsuri/financial-calculation-app
* https://www.xignite.com/product/global-stock-quote-data/api/GetTopMarketMovers/

#### フレームワーク・ライブラリ・モジュール
* I was in charge of getting APIs to integrate with our system and also make sure that the financial calculations worked.
* I also made the logic behind the application in terms of variables, screens, and I/O.  There is plently of potential to add on to this application to make it better so we made to sure to make the base of the application workable so that we can add on to it later.  
<br> 
* For the financial calculations I had two options: find an API to take the input and get output or create the equations       native to the application and have it run this way.  Finding an API was not easy so I took on the task of having the        calculations be a part of the application first.  After, I also found a financial calculator API that had a similar         function.
<br>
* As part of the results on the Smart Finance application we included a section for Potential Options/Advice. This includes jobs, investments/equities, and other methods that are better than the current ones that the user inputted. To get these results, we needed to get data through an APIs that include relevant information and then somehow compare the best options given from the APIs to the users' accounts and only display options that are better.


#### デバイス
* iPhone
* Android 

### 独自技術

#### 期間中に開発した独自機能・技術
