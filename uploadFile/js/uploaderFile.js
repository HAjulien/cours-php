const form = document.querySelector("form"),
  fileInput = form.querySelector(".file-input"),
  progressArea = document.querySelector(".progress-area"),
  uploadedArea = document.querySelector(".uploaded-area"),
  SIZE_KBIT = 1000;

form.addEventListener("click", function () {
  fileInput.click();
});

function uploadFile(name) {
  let xhr = new XMLHttpRequest();
  xhr.open("POST", "php/upload.php");
  xhr.upload.addEventListener("progress", ({ loaded, total }) => {
    let fileLoaded = Math.floor((loaded / total) * 100);
    let fileTotal = Math.floor(total / SIZE_KBIT);

    let progressHTML = ` 
    <li class="row">
      <i class="fas fa-file-alt"></i>
      <div class="content">
        <div class="details">
          <span class="name">${name} • Uploading</span>
          <span class="percent">${fileLoaded}%</span>
        </div>
        <div class="progress-bar">
          <div class="progress" style="width: ${fileLoaded}%"></div>
        </div>
      </div>
    </li> 
    `;
    progressArea.innerHTML = progressHTML;

    if ((loaded = total)) {
      progressArea.innerHTML = ""
      let uploadedHTML = `
        <li class="row">
          <div class="content upload">
            <i class="fas fa-file-alt"></i>
            <div class="details">
              <span class="name">${name} • Uploaded</span>
              <span class="size">${fileTotal} </span>
            </div>
          </div>
          <i class="fas fa-check"></i>
        </li>
      `;
      uploadedArea.classList.remove("onprogress");
      uploadedArea.insertAdjacentHTML("afterbegin", uploadedHTML);
    }
  });
  let formData = new FormData(form);
  xhr.send(formData);
}

fileInput.addEventListener("change", ({ target }) => {
  let file = target.files[0];
  if (!file) return null;
  let fileName = file.name;
  uploadFile(fileName);
});
