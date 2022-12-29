const pay = () => {
  // PAY.JPテスト公開鍵（payjp.jsライブラリの中で定義されているメソッド）
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  // 入力フォーム全体を、変数に定義
  const form = document.getElementById("charge-form");
  // クリックした時に実行
  form.addEventListener("submit", (e) => {
    // submitボタンをクリックすることで起こる標準設定されているイベントを阻止
    e.preventDefault();
    // "charge-form"というidでフォームの情報を取得し、それをFormDataオブジェクト(フォームに入力された値を取得できるオブジェクト)として生成
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
// 生成したFormDataオブジェクトから、クレジットカードに関する情報を取得し、変数cardに代入するオブジェクトとして定義（name属性の値）
    const card = {
      number: formData.get("order_address[number]"),
      exp_month: formData.get("order_address[exp_month]"),
      exp_year: `20${formData.get("order_address[exp_year]")}`,
      cvc: formData.get("order_address[cvc]"),
    };
   // 第一引数は15行目で定義したカード情報。第二関数はアロー関数を用いてPAYJP側からのレスポンス・ステータスコードを受け取った後の処理を定義
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        console.log(status)
        // response.idとすることでトークンの値を取得
        const token = response.id;
        // HTMLのinput要素にトークンの値を埋め込み、フォームに追加
        const renderDom = document.getElementById("charge-form");
        // valueは実際に送られる値、nameはその値を示すプロパティ名（params[:name]のように取得できるようになる）を示す。トークンはユーザーに見せる必要がないのでtype属性の値にhiddenを指定。
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        // フォームの中に作成したinput要素を追加（内部の最後の子要素の後に挿入）
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);