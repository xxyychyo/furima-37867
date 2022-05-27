window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  // 入力した金額をもとに販売手数料を計算する処理
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
  // 出品価格から販売手数料を引く処理
  ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});
// console.log(priceInput)中に知りたいことを書くイベント発火

// 4行目入力した金額の値を取得したい場合は、value属性を指定