CREATE TABLE question (
    question_id SERIAL NOT NULL,
    name text UNIQUE,
    question_content text NOT NULL,
    iframe_url text NOT NULL,
    input text NOT NULL,
    output text NOT NULL,
    input2 text NOT NULL,
    output2 text NOT NULL,
    input3 text NOT NULL,
    output3 text NOT NULL,
    hint text NOT NULL DEFAULT 'ヒントはありません。',
    difficulty VARCHAR(10) DEFAULT 'NONE',
    basename text DEFAULT '',
    commentary text DEFAULT '',
    PRIMARY KEY (question_id)
);
CREATE TABLE submit (
    response_id SERIAL NOT NULL,
    student_id int NOT NULL,
    question_id int NOT NULL,
    result text NOT NULL,
    source text NOT NULL,
    readhint INT NOT NULL DEFAULT 0,
    submitted_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (response_id),
    FOREIGN KEY (question_id) REFERENCES question (question_id)
);
INSERT INTO question (
        question_id,
        name,
        question_content,
        iframe_url,
        input,
        output,
        input2,
        output2,
        input3,
        output3,
        hint
    )
VALUES (
        1,
        '第1問',
        'scanf関数を呼び出して、2つの正の整数を受け取り変数nおよびmに格納したあと、出力例のように、行数がn、列数がmの「*」による長方形のような並びを出力するプログラムを作成してください。',
        'https://paiza.io/projects/e/UNWMZBJv3imIf1-purutqQ?theme=twilight',
        E'3 4\n',
        E'****\n****\n****\n',
        E'6 5\n',
        E'*****\n*****\n*****\n*****\n*****\n*****\n',
        E'1 1\n',
        E'*\n',
        '九九のプログラムを手直しするといいでしょう。変数n、mと別に、forループのための変数宣言が必要となります。繰返し回数と、forループの中で何を出力すればよいかを正しく書いて、Acceptedを目指してください。'
    ),(
        2,
        '第2問',
        'scanf関数を呼び出して、1つの整数を受け取り変数nに格納したあと、出力例のように、1行目に1個の「*」、1行増えるごとに「*」の数を1ずつ増やして、n行目にn個の「*」で、直角三角形のような並びを出力するプログラムを作成してください。<br>0または負の値がnに格納された場合には、何も出力せずにプログラムを終了してください。1の場合には、「*」と改行だけを出力しなさい。',
        'https://paiza.io/projects/e/Evck7TD6YSM3n5v3phhgEQ?theme=twilight',
        E'4\n',
        E'*\n**\n***\n****\n',
        E'7\n',
        E'*\n**\n***\n****\n*****\n******\n*******\n',
        E'1\n',
        E'*\n',
        '第1問と同じように、2重ループにします。外側の繰返しの条件は、nと外側のループ用変数を使用して、条件式を書いてください。内側の繰返しの条件は、内側と外側のループ用変数を使用して、条件式を書いてください。i 行目（1≦i≦n）には「*」を連続して i 個、出力させましょう。'
    ),(
        3,
        '第3問',
        'scanf関数を呼び出して、1つの整数を受け取り変数nに格納したあと、出力例のように、1行目にn個の「*」、1行増えるごとに「*」の数を1ずつ減らして、n行目に1個の「*」で、直角三角形のような並びを出力するプログラムを作成してください。<br>0または負の値がnに格納された場合には、何も出力せずにプログラムを終了してください。1の場合には、「*」と改行だけを出力しなさい。',
        'https://paiza.io/projects/e/Evck7TD6YSM3n5v3phhgEQ?theme=twilight',
        E'4\n',
        E'****\n***\n**\n*\n',
        E'6\n',
        E'******\n*****\n****\n***\n**\n*\n',
        E'1\n',
        E'*\n',
        '第2問が正しく作れたら、2重ループの内側のforの行を変更するだけで、第3問もAcceptedを得ることができます。第2問では、i 行目（1≦i≦n）には「*」を連続して i 個、出力させればよかったのですが、この問題では、i 行目に「*」を連続して何個、出力すればいいでしょうか。n と i を使った式で表してみてください。'
    ),(
        4,
        '第4問',
        'scanf関数を呼び出して、1つの整数を受け取り変数nに格納したあと、出力例のように、1行目に1個の「*」、1行増えるごとに「*」の数を1ずつ増やして、n行目にn個の「*」、その後は1ずつ減らして、二等辺三角形のような並びを出力するプログラムを作成してください。<br>0または負の値がnに格納された場合には、「invalid」を出力して改行し、プログラムを終了してください。1の場合には、「*」と改行だけを出力しなさい。',
        'https://paiza.io/projects/e/Evck7TD6YSM3n5v3phhgEQ?theme=twilight',
        E'4\n',
        E'*\n**\n***\n****\n***\n**\n*\n',
        E'9\n',
        E'*\n**\n***\n****\n*****\n******\n*******\n********\n*********\n********\n*******\n******\n*****\n****\n***\n**\n*\n',
        E'0\n',
        E'invalid\n',
        'n行目までの出力で一つの2重ループ、そのあとにまた別の2重ループを書くといいでしょう。第2問・第3問で作成したプログラムの2重ループが活用できます。ただし、あとの2重ループの出力の行数がn行ではなくn-1行になる点だけは注意してください。</li><li>きちんと「*」の描画ができているはずなのに、何度提出しても「Wrong Answer」となる人へ：「invalid」を出力する処理を忘れていませんか。'
    ),(
        5,
        '第5問',
        'scanf関数を呼び出して、1つの整数を受け取り変数nに格納したあと、出力例のように、1行目に1個の「*」、1行増えるごとに「*」の数を1ずつ増やして、n行目にn個の「*」、その後は左から1ずつ「*」を空白文字に置き換えていき、平行四辺形のような並びを出力するプログラムを作成してください。<br>0または負の値がnに格納された場合には、「invalid」を出力して改行し、プログラムを終了してください。1の場合には、「*」と改行だけを出力しなさい。',
        'https://paiza.io/projects/e/Evck7TD6YSM3n5v3phhgEQ?theme=twilight',
        E'4\n',
        E'*\n**\n***\n****\n ***\n  **\n   *\n',
        E'7\n',
        E'*\n**\n***\n****\n*****\n******\n*******\n ******\n  *****\n   ****\n    ***\n     **\n      *\n',
        E'-1\n',
        E'invalid\n',
        'n=4のとき、5行目の出力は、1個の空白文字と3個の「*」になります。他のnの値や行でもうまくいくよう、空白文字を出力するためのforループを書いて、「*」を出力するためのforループの前に置き、順に実行するようにしてください。第4問をヒントどおりに作成したら、あとの2重ループの中を変更するだけで完成します。</li><li>ところで、第4問も第5問も、2重ループは1つだけでAcceptedにできます。ただし処理は複雑になります。'
    ),(
        6,
        '第6問',
        'scanf関数を呼び出して、正の奇数を受け取り変数nに格納したあと、出力例のように、1行目に1個の「*」、1行増えるごとに「*」の数を2ずつ増やして、ちょうどn個の「*」を出力した後は、「*」の数を2ずつ減らして、n行で「◆」のような並びを出力するプログラムを作成してください。<br>変数nに、0または負の値が格納された場合には「invalid」を、正の偶数が格納されたときには「even」を出力して、改行し、プログラムを終了してください。1の場合には、「*」と改行だけを出力しなさい。',
        'https://paiza.io/projects/e/UYiXc9-872D9GI0UJAk5CA?theme=twilight',
        E'7\n',
        E'   *\n  ***\n *****\n*******\n *****\n  ***\n   *\n',
        E'11\n',
        E'     *\n    ***\n   *****\n  *******\n *********\n***********\n *********\n  *******\n   *****\n    ***\n     *\n',
        E'8\n',
        E'even\n',
        '変数は、入力を格納するための n、2重ループの i と j のほか、1つの行で出力する空白文字の数を r に、「*」の数を s に、それぞれ格納するといいでしょう。1行分を出力したら（内側のループのあと、外側のループの中で）、r と s の値を変えます。ちょうど n 個の「*」を出力するのは、(n+1)/2 行目となることに注意して、条件分岐により「r を1減らして s を2増やす」か「r を1増やして s を2減らす」ようにします。</li><li>「invalid」または「even」を出力したら、すぐにreturn 0;でプログラムを終了することをおすすめします。'
    ),(
        7,
        '第7問',
        'scanf関数を呼び出して、正の偶数を受け取り変数nに格納したあと、出力例のように、1行目に2個の「*」、1行増えるごとに「*」の数を2ずつ増やして、n/2行目とその次の行にちょうどn個の「*」を出力した後は、「*」の数を2ずつ減らして、n行で「◆」のような並びを出力するプログラムを作成してください。<br>変数nに、0または負の値が格納された場合には「invalid」を、正の奇数が格納されたときには「odd」を出力して、改行し、プログラムを終了してください。2の場合には、1行目も2行目も「**」を出力しなさい。',
        'https://paiza.io/projects/e/GOVvcwiB5c0do1KGcYTZHQ?theme=twilight',
        E'8\n',
        E'   **\n  ****\n ******\n********\n********\n ******\n  ****\n   **\n',
        E'6\n',
        E'  **\n ****\n******\n******\n ****\n  **\n',
        E'7\n',
        E'odd\n',
        '第6問で完成させたプログラムを、修正するといいでしょう。ヒントどおりに作成したら、この問題では、「r を1減らして s を2増やす」と「r を1増やして s を2減らす」のほか、「r も s も値を変えない」場合があるので注意してください。</li><li>「*」の並びを出力せずに終了する条件とメッセージも、変更するのを忘れずに。'
    ),(
        8,
        '第8問',
        'scanf関数を呼び出して、2つの正の整数を受け取り変数nおよびmに格納したあと、出力例のように、「*」のジグザグな進行を出力するプログラムを作成しなさい。<br>mが十分に大きいときの出力内容は、次のようになります。1行目からn行目までは、n列目に「*」を出力して、「*」が右下に進むように見せます。その次からは、「*」を左端に出力するまで、「*」が左下に進むように見せます。この繰り返しです。<br>0または負の値が、nとmの少なくとも一方に格納された場合には、「invalid」を出力して改行し、プログラムを終了してください。1がnに（そして正の整数がmに）格納された場合には、空白文字なしで「*」をm行、出力しなさい。',
        'https://paiza.io/projects/e/hLjOiBzWK_qfTaa24KP4rg?theme=twilight',
        E'5 16\n',
        E'*\n *\n  *\n   *\n    *\n   *\n  *\n *\n*\n *\n  *\n   *\n    *\n   *\n  *\n *\n',
        E'7 14\n',
        E'*\n *\n  *\n   *\n    *\n     *\n      *\n     *\n    *\n   *\n  *\n *\n*\n *\n',
        E'1 7\n',
        E'*\n*\n*\n*\n*\n*\n*\n',
        'n が2以上、m が1以上のとき、1行目から m 行目まで、「*」をちょうど1個ずつ、出力します。i 行目の先頭から x 文字目に「*」を出力するものとして、その関係を x=f(i) という式で表すと、f(i)は周期関数となり、基本周期は(n-1)*2です（例えば n=5 なら基本周期は8です。なお、関数 f をプログラムで定義する必要はありません）。</li><li>問題文では「1行目からn行目までは、n列目に「*」を出力」と書かれていますが、実際には n-1 行ずつ（n=5なら4行ずつ）のまとまりとして考えると、分かりやすくなります。周期と、その半分の値を、それぞれ変数に格納し、n と i、剰余演算子 %、if～elseなどを組み合わせることで、x を求めることができます。'
    ),(
        9,
        '第9問',
        'scanf関数を呼び出して、2つの正の整数を受け取り変数nおよびmに格納したあと、出力例のように、「*」のジグザグな進行を出力するプログラムを作成しなさい。<br>mが十分に大きいときの出力内容は、次のようになります。1列目からn列目までは，n行目に「*」を出力して、「*」が右下に進むように見せます。その次からは、「*」が右上に進むように見せます。この繰り返しです。mがnより小さいときは、m行分だけ出力します。<br>0または負の値が、nとmの少なくとも一方に格納された場合には、「invalid」を出力して改行し、プログラムを終了してください。1がnに（そして正の整数がmに）格納された場合には、「*」をm個と改行を出力しなさい。',
        'https://paiza.io/projects/e/hLjOiBzWK_qfTaa24KP4rg?theme=twilight',
        E'5 16\n',
        E'*       *\n *     * *     *\n  *   *   *   *\n   * *     * *\n    *       *\n',
        E'4 20\n',
        E'*     *     *     *\n *   * *   * *   * *\n  * *   * *   * *\n   *     *     *\n',
        E'7 2\n',
        E'*\n *\n',
        '第8問のプログラムをもとに、出力を縦横反対にできればいいのですが、「はじめに1列目を出力して、次に2列目…」と実行していくわけにはいきません。以下の2通りの方針を読んで、プログラムを書きやすいと思ったほうを選んでください。<ul><li>i 行目（1≦i≦min{n,m}）の出力を行うにあたり、最初に r1 個の空白、そして「*」、次に r2 個の空白、そして「*」、次に r3 個の空白、そして「*」を出力するものとして、r1、r2、r3 の値（いずれも0以上の整数値）を、n と i を用いて求めます（例えば n=5、i=1 のときは、r1=0、r2=r3=7 となり、n=5、i=2 のときは、r1=1、r2=5、r3=1です。）。それ以降の出力は、r2 個の空白、そして「*」、次に r3 個の空白、そして「*」の繰り返しとなります（r2+1+r3+1 が周期になります。ただし基本周期であるとは限りません）。改行の前に不要な空白文字を出力しないようにしましょう。</li><li>n×(m+1) のサイズのcharの2次元配列を宣言し、それぞれの要素には、空白文字、「*」、文字列の終端文字（ナル文字またはヌル文字とも言います）のいずれかを格納します。問題文のルールに従い、配列の先頭は1ではなく0であることにも注意して、2次元配列の中のいくつかの要素を''*''にします。不要な空白文字を出力しないよう処理をしてから、for文で、それぞれの行を出力します。</li></ul></li><li>「mがnより小さいときは、m行分だけ出力します。」も、忘れないようにしてください。「n と m の小さいほう」を変数に格納してfor文で参照するのでもいいですが、for文の条件をうまく書けばそのような変数を使用しなくてもできます。'
    );

-- iframe_urlの値の取得方法
-- 1. https://paiza.io/ja にアクセスし、コード作成ボタンを押す
-- 2. ソースコードを打ち込み、必要に応じて入力欄に値を指定し、実行ボタンを押す
-- 3. 実行ボタンの行の右端にある共有と埋め込みボタンを押す
-- 4. 埋め込みタグ内のsrc属性の値をコピーする
-- 注意:複数の問題を登録する際、手順1からやり直す
