function makeURL(e) {
    const yyyymmdd = document.querySelector('#yyyymmdd').value.replace(/-/g, "")
    const user = document.querySelector('#user').value
    const repo = document.querySelector('#repo').value
    const path = encodeURIComponent(document.querySelector('#path').value)
    const branch = encodeURIComponent(document.querySelector('#branch').value)
    let url = location.protocol + "//" + location.host
        + `?yyyymmdd=${yyyymmdd}`
        + `&user=${user}`
        + `&repo=${repo}`
    if (path) {
        url += `&path=${path}`
    }
    if (branch) {
        url += `&branch=${branch}`
    }
    document.querySelector('#result').value = url
    document.querySelector('#result_tag').value = `![sendokun](${url})`
}
function copyText(id) {
    const copyTarget = document.getElementById(id);
    copyTarget.select();
    navigator.clipboard.writeText(copyTarget.value)
}

document.addEventListener('DOMContentLoaded', () => {
    document.querySelector('#make').addEventListener('click', makeURL)
    document.querySelector('#copy_result').addEventListener('click', () => { copyText("result") })
    document.querySelector('#copy_result_tag').addEventListener('click', () => { copyText("result_tag") })
});