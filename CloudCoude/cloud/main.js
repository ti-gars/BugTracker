
// Use Parse.Cloud.define to define as many cloud functions as you want.
// For example:
Parse.Cloud.define("hello", function(request, response) {
  response.success("Hello world!");
});

Parse.Cloud.define("averageStars", function(request, response) {
  // var query = new Parse.Query("Review");
  // query.equalTo("movie", request.params.movie);
  // query.find({
  //   success: function(results) {
  //     var sum = 0;
  //     for (var i = 0; i < results.length; ++i) {
  //       sum += results[i].get("stars");
  //     }
  //     response.success(sum / results.length);
  //   },
  //   error: function() {
  //     response.error("movie lookup failed");
  //   }
  // });
response.success(5);
});

Parse.Cloud.define("createIssue", function(request, response) {
 var issueTitle = request.params.title
 var issueDescription = request.params.description
 var issueType = request.params.type
 var objectId = request.params.assignedTo

var GameScore = Parse.Object.extend("_User");
var query = new Parse.Query(GameScore);
var gameScore = new GameScore();

query.get(objectId, {
  success: function(gameScore) {
    // The object was retrieved successfully.
     var IssueClass = Parse.Object.extend("Issue");
	 var issue = new IssueClass();

      issue.set("Title", issueTitle);
      issue.set("Description", issueDescription);
      issue.set('Type', issueType);
      issue.set('AssignedTo', gameScore);

            issue.save(null, {
        success: function(issue) {
          // Execute any logic that should take place after the object is saved.
          alert('New object created with objectId: ' + issue.id);
        },
        error: function(issue, error) {
          // Execute any logic that should take place if the save fails.
          // error is a Parse.Error with an error code and message.
          alert('Failed to create new object, with error code: ' + error.message);
        }
      });
  },
  error: function(object, error) {
    // The object was not retrieved successfully.
    // error is a Parse.Error with an error code and message.
    alert('Erreur');
  }
});



});
