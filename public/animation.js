$(function() {

// var initialIds = <%= @initial_ids %>;
// var resultIds = <%= @result_ids %>;

var width = 1000,
    height = 100;

var svg = d3.select(".yo").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(20," + (height / 2) + ")");

function update(data) {

  // DATA JOIN
  // join new data with old elements, if any.
  //text is our Update variable
  var text = svg.selectAll("text")
    .data(data, function(d) { return d[1]; });

  //UPDATE
  text.attr("class", "update")
    .transition()
      .duration(750)
      .attr("x", function(d, i) { return i * 16; });

  //ENTER
  //create new elements as needed
  text.enter().append("text")
      .attr("class", "enter")
      .attr("dy", ".35em")
      .attr("y", -60)
      .attr("x", function(d, i) { return i * 16; })
      .style("fill-opacity", 1e-6)
      .text(function(d) { return d[0]; })
    .transition()
      .duration(750)
      .attr("y", 0)
      .style("fill-opacity", 1);

  text.exit()
      .attr("class", "exit")
    .transition()
      .duration(750)
      .attr("y", 60)
      .style("fill-opacity", 1e-6)
      .remove();
}

update(initialIds);
var showingPigLatin = true;

setInterval(function() {
  if (showingPigLatin) {
    update(resultIds);
  } else {
    update(initialIds);
  }
  showingPigLatin = !showingPigLatin;
}, 2000);

});
