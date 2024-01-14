window.addEventListener("message", (event) => {
	let data = event.data
	if (data.action === "showPedInfo") {
		showPedInfo(data.content)
		document.querySelector(".info-container").style.right = "3%"
	}
	if (data.action === "hidePedInfo") {
		resetContent()
		document.querySelector(".info-container").style.right = "-25%"
	}
})

function showPedInfo(content) {
	const pedName = document.querySelector(".ped-name")
	const pedModel = document.querySelector(".ped-model")
	const pedGender = document.querySelector(".ped-gender")
	const pedGenderNum = document.querySelector(".ped-gender-num")
	const pedPos = document.querySelector(".ped-pos")
	const pedHeading = document.querySelector(".ped-heading")

	pedName.textContent = `Name: ${content.name}`
	pedModel.textContent = `Model: ${content.model}`
	pedGender.textContent = `Gender: ${content.genderName}`
	pedGenderNum.textContent = `Gender Num: ${content.genderNum}`
	pedPos.textContent = `Pos: x:${content.pos.x}, y:${content.pos.y}, z:${content.pos.z}`
	pedHeading.textContent = `Heading: ${content.heading}`
}

function resetContent() {
	const pedName = document.querySelector(".ped-name")
	const pedModel = document.querySelector(".ped-model")
	const pedGender = document.querySelector(".ped-gender")
	const pedGenderNum = document.querySelector(".ped-gender-num")
	const pedPos = document.querySelector(".ped-pos")
	const pedHeading = document.querySelector(".ped-heading")

	pedName.textContent = ""
	pedModel.textContent = ""
	pedGender.textContent = ""
	pedGenderNum.textContent = ""
	pedPos.textContent = ""
	pedHeading.textContent = ""
}
