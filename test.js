const p = document.querySelector("p")
const addBtn = document.querySelector(".add")
var i = 0
addBtn.onclick = () => {
  p.innerHTML = ++i
}
