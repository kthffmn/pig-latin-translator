//set height and width of our container
var piglatin = [["p", 0],["i", 1],["g",2],["l",3],["a",4],["t",5],["i",6],["n",7]];
var igpayatinlay = [["i", 1],["g",2],["p", 0],["a", 8],["y", 9],["a",4],["t",5],["i",6],["n",7],["l",3],["a", 10],["y", 11]];

var width = 960,
    height = 500;

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height)
  .append("g")
    .attr("transform", "translate(32," + (height / 2) + ")");

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
      .attr("x", function(d, i) { return i * 32; });

  //ENTER
  //create new elements as needed
  text.enter().append("text")
      .attr("class", "enter")
      .attr("dy", ".35em")
      .attr("y", -60)
      .attr("x", function(d, i) { return i * 32; })
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

update(piglatin);
var showingPigLatin = true;

setInterval(function() {
  if (showingPigLatin) {
    update(igpayatinlay);
  } else {
    update(piglatin);
  }
  showingPigLatin = !showingPigLatin;
}, 2000);
