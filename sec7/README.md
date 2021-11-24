2021.11.24

Baba-Tabataの保存的有限要素法のプログラムです。
移流項に関する双線形形式の計算を、どうしても自分で書かねばならず、MATLABを使いました。

使うのは、
- p1fem1convect.m
- mk_square5.m
- getmesh.m
- matrix1bt.m
- P1grad.m
- plot_p1fem.m
- convection_func1.m
です。

メッシュデータsquare5_40.datは、次で作りました。
>> mk_square5(1,40)

fやb=(b_1,b_2)，初期値u^0などはconvection_func1.mで定義しています。

T=1まで解く場合には、次のようにします。
>> p1fem1convect("square5_40.dat",@convection_func1,1)


各プログラムを細かく説明している暇はありません。
Poisson方程式に対する説明を、fem_matlab.pdfに書きましたので、参考にしてください。
この例では、
- fem_func1.m
- boundary1.m
- dirichlet1.m
- matrix1.m
- p1fem1.m
- mk_square1.m
- square1_30.dat
も使っています。

これを、次のように実行します。
>> p1fem1("square1_20.dat",@fem_func1)

以上
