const p = document.querySelector("p")
const btn = document.querySelector(".getImg")
const xhr = new XMLHttpRequest()
const imgUrl = []
var i = 0
xhr.open("GET", "https://jsonplaceholder.typicode.com/photos")
xhr.send()
xhr.onreadystatechange = () => {
  if (xhr.readyState === 4) {
    if (xhr.status >= 200 && xhr.status < 300) {
      const res = JSON.parse(xhr.response)
      for (let i = 0; i < res.length; i++) {
        imgUrl.push(res[i].url)
      }
    }
  }
}
btn.addEventListener("click", () => {
  const imgs = document.createElement("img")
  imgs.src = imgUrl[i]
  i += 1
  p.appendChild(imgs)
})
