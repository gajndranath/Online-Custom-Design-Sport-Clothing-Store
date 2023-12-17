const text = document.querySelector('.cricle-text p');
text.innerHTML = text.innerText.split('').map(
    (char, i) =>
    `<span style ="transform:rotate(${i*14.5}deg)">${char}</span>`
).join(''); 