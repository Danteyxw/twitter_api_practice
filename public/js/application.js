function fetch() {
	if ($(".container").attr("id") == "tweets.erb") {
		$(".loading").show();
		$.ajax({
			url: '/fetch',
			method: 'post',
			data: {screen_name: $("h1").text()}
		}).done(function(data) {
			$(".loading").hide();

			$("#tweets").append(data)
		});
	}
}

$(document).ready(function() {
	fetch();
});
