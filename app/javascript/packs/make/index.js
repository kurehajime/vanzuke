function makeURL(e) {
    const repo = document.querySelector('#repo').value
    const count = document.querySelector('#count').value
    const years = document.querySelector('#years').value
    const monthes = document.querySelector('#monthes').value
    const days = document.querySelector('#days').value

    let url = location.protocol + "//" + location.host
        + `?repo=${repo}`
        + `&count=${count}`
        + `&years=${years}`
        + `&monthes=${monthes}`
        + `&days=${days}`
    document.querySelector('#result').value = url
    document.querySelector('#result_tag').value = `![vanzuke](${url})`
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