require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Canvas::User do

  before(:each) do
  end

  it "should create a new instance given valid options" do
    FactoryGirl.build(:user)
  end

end

Users API

Users	List usersList the activity streamList the TODO itemsUpload a fileCreate a userEdit a userDelete a userFollow a userUn-follow a userGet user profileList avatar optionsList user page views
API for accessing information on the current and other users.

Throughout this API, the :user_id parameter can be replaced with self as a shortcut for the id of the user accessing the API. For instance, users/:user_id/page_views can be accessed as users/self/page_views to access the current user's page views.

List users
GET /api/v1/accounts/:account_id/users
Retrieve the list of users associated with this account.
Example Response:
[
  { "id": 1, "name": "Dwight Schrute", "sortable_name": "Schrute, Dwight", "short_name": "Dwight", "login_id": "dwight@example.com", "sis_user_id": "12345", "sis_login_id": null },
  { "id": 2, "name": "Gob Bluth", "sortable_name": "Bluth, Gob", "short_name": "Gob Bluth", "login_id": "gob@example.com", "sis_user_id": "67890", "sis_login_id": null }
]

List the activity stream
GET /api/v1/users/self/activity_stream
GET /api/v1/users/activity_stream
Returns the current user’s global activity stream, paginated.
There are many types of objects that can be returned in the activity stream. All object types have the same basic set of shared attributes:
{
  'created_at': '2011-07-13T09:12:00Z',
  'updated_at': '2011-07-25T08:52:41Z',
  'id': 1234,
  'title': 'Stream Item Subject',
  'message': 'This is the body text of the activity stream item. It is plain-text, and can be multiple paragraphs.',
  'type': 'DiscussionTopic|Conversation|Message|Submission|Conference|Collaboration|...',
  'context_type': 'course', // course|group
  'course_id': 1,
  'group_id': null,
  'html_url': "http://..." // URL to the Canvas web UI for this stream item
}
In addition, each item type has its own set of attributes available.
DiscussionTopic:
{
  'type': 'DiscussionTopic',
  'discussion_topic_id': 1234,
  'total_root_discussion_entries': 5,
  'require_initial_post': true,
  'user_has_posted': true,
  'root_discussion_entries': {
    ...
  }
}
For DiscussionTopic, the message is truncated at 4kb.
Announcement:
{
  'type': 'Announcement',
  'announcement_id': 1234,
  'total_root_discussion_entries': 5,
  'require_initial_post': true,
  'user_has_posted': null,
  'root_discussion_entries': {
    ...
  }
}
For Announcement, the message is truncated at 4kb.
Conversation:
{
  'type': 'Conversation',
  'conversation_id': 1234,
  'private': false,
  'participant_count': 3,
}
Message:
{
  'type': 'Message',
  'message_id': 1234,
  'notification_category': 'Assignment Graded'
}
Submission:

Returns an Submission with its Course and Assignment data.

Conference:

{
  'type': 'Conference',
  'web_conference_id': 1234
}
Collaboration:

{
  'type': 'Collaboration',
  'collaboration_id': 1234
}
CollectionItem:

{
  'type': 'CollectionItem',
  'collection_item' { ... full CollectionItem data ... }
}


List the TODO items
GET /api/v1/users/self/todo
Returns the current user’s list of todo items, as seen on the user dashboard.
There is a limit to the number of items returned.
The `ignore` and `ignore_permanently` URLs can be used to update the user’s preferences on what items will be displayed. Performing a DELETE request against the `ignore` URL will hide that item from future todo item requests, until the item changes. Performing a DELETE request against the `ignore_permanently` URL will hide that item forever.
Example Response:
[
  {
    'type': 'grading',        // an assignment that needs grading
    'assignment': { .. assignment object .. },
    'ignore': '.. url ..',
    'ignore_permanently': '.. url ..',
    'html_url': '.. url ..',
    'needs_grading_count': 3, // number of submissions that need grading
    'context_type': 'course', // course|group
    'course_id': 1,
    'group_id': null,
  },
  {
    'type' => 'submitting',   // an assignment that needs submitting soon
    'assignment' => { .. assignment object .. },
    'ignore' => '.. url ..',
    'ignore_permanently' => '.. url ..',
    'html_url': '.. url ..',
    'context_type': 'course',
    'course_id': 1,
  }
]


Upload a file
POST /api/v1/users/:user_id/files
Upload a file to the user’s personal files section.
This API endpoint is the first step in uploading a file to a user’s files. See the File Upload Documentation for details on the file upload workflow.
Note that typically users will only be able to upload files to their own files section. Passing a user_id of self is an easy shortcut to specify the current user.


Create a user
POST /api/v1/accounts/:account_id/users
Create and return a new user and pseudonym for an account.
Request Parameters:

 user[name]
Optional
The full name of the user. This name will be used by teacher for grading.

 user[short_name]
Optional
User’s name as it will be displayed in discussions, messages, and comments.

 user[sortable_name]
Optional
User’s name as used to sort alphabetically in lists.

 user[time_zone]
Optional
The time zone for the user. Allowed time zones are listed in The Ruby on Rails documentation.

 user[locale]
Optional
The user’s preferred language as a two-letter ISO 639-1 code. Current supported languages are English (“en”) and Spanish (“es”).

 user[birthdate]
Optional
The user’s birth date.

 pseudonym[unique_id]
User’s login ID.

 pseudonym[password]
Optional
User’s password.

 pseudonym[sis_user_id]
Optional
Integer
SIS ID for the user’s account. To set this parameter, the caller must be able to manage SIS permissions.

 pseudonym[send_confirmation]
Optional, 0|1
Integer
Send user notification of account creation if set to 1.


Edit a user
PUT /api/v1/users/:id
Modify an existing user. To modify a user’s login, see the documentation for logins.
Request Parameters:

 user[name]
Optional
The full name of the user. This name will be used by teacher for grading.

 user[short_name]
Optional
User’s name as it will be displayed in discussions, messages, and comments.

 user[sortable_name]
Optional
User’s name as used to sort alphabetically in lists.

 user[time_zone]
Optional
The time zone for the user. Allowed time zones are listed in The Ruby on Rails documentation.

 user[locale]
Optional
The user’s preferred language as a two-letter ISO 639-1 code. Current supported languages are English (“en”) and Spanish (“es”).

 user[avatar][token]
Optional
A unique representation of the avatar record to assign as the user’s current avatar. This token can be obtained from the user avatars endpoint. This supersedes the user[url] argument, and if both are included the url will be ignored. Note: this is an internal representation and is subject to change without notice. It should be consumed with this api endpoint and used in the user update endpoint, and should not be constructed by the client.

 user[avatar][url]
Optional
To set the user’s avatar to point to an external url, do not include a token and instead pass the url here. Warning: For maximum compatibility, please use 50 px square images.

Example Request:

curl 'http://<canvas>/api/v1/users/133.json' \ 
     -X PUT \ 
     -F 'user[name]=Sheldon Cooper' \ 
     -F 'user[short_name]=Shelly' \ 
     -F 'user[time_zone]=Pacific Time (US & Canada)' \ 
     -F 'user[avatar][token]=<opaque_token>' \ 
     -H "Authorization: Bearer <token>"
Example Response:


{
  "id":133,
  "login_id":"sheldor@example.com",
  "name":"Sheldon Cooper",
  "short_name":"Shelly",
  "sortable_name":"Cooper, Sheldon",
  "avatar_url":"http://<canvas>/images/users/133-..."
}
Delete a user UsersController#destroy

DELETE /api/v1/accounts/:account_id/users/:id

Delete a user record from Canvas.

WARNING: This API will allow a user to delete themselves. If you do this, you won’t be able to make API calls or log into Canvas.

Example Request:


curl https://<canvas>/api/v1/users/5 \ 
  -H 'Authorization: Bearer <ACCESS_TOKEN>' \ 
  -X DELETE
Example Response:


{
  "id":133,
  "login_id":"bieber@example.com",
  "name":"Justin Bieber",
  "short_name":"The Biebs",
  "sortable_name":"Bieber, Justin"
}


Follow a user
BETA: This API endpoint is not finalized, and there could be breaking changes before its final release.
PUT /api/v1/users/:user_id/followers/self
Follow this user. If the current user is already following the target user, nothing happens. The target user must have a public profile in order to follow it.
On success, returns the User object. Responds with a 401 if the user doesn’t have permission to follow the target user, or a 400 if the user can’t follow the target user (if the user and target user are the same, for example).
Example Request:
curl https://<canvas>/api/v1/users/<user_id>/followers/self \ 
     -X PUT \ 
     -H 'Content-Length: 0' \ 
     -H 'Authorization: Bearer <token>'
Example Response:
{
  following_user_id: 5,
  followed_user_id: 6,
  created_at: <timestamp>
}


Un-follow a user
BETA: This API endpoint is not finalized, and there could be breaking changes before its final release.
DELETE /api/v1/users/:user_id/followers/self
Stop following this user. If the current user is not already following the target user, nothing happens.
Example Request:
curl https://<canvas>/api/v1/users/<user_id>/followers/self \ 
     -X DELETE \ 
     -H 'Authorization: Bearer <token>'


Get user profile ProfileController#settings
GET /api/v1/users/:user_id/profile
Returns user profile data, including user id, name, and profile pic.
When requesting the profile for the user accessing the API, the user’s calendar feed URL will be returned as well.
Example Response:
{
  'id': 1234,
  'name': 'Sample User',
  'sortable_name': 'user, sample',
  'email': 'sample_user@example.com',
  'login_id': 'sample_user@example.com',
  'sis_user_id': 'sis1',
  'sis_login_id': 'sis1-login',
  'avatar_url': '..url..',
  'calendar': { 'ics' => '..url..' }
}


List avatar options
GET /api/v1/users/:user_id/avatars
Retrieve the possible user avatar options that can be set with the user update endpoint. The response will be an array of avatar records. If the ‘type’ field is ‘attachment’, the record will include all the normal attachment json fields; otherwise it will include only the ‘url’ and ‘display_name’ fields. Additionally, all records will include a ‘type’ field and a ‘token’ field. The following explains each field in more detail

type
“gravatar”|“twitter”|“linked_in”|“attachment”|“no_pic”
The type of avatar record, for categorization purposes.

url
The url of the avatar

token
A unique representation of the avatar record which can be used to set the avatar with the user update endpoint. Note: this is an internal representation and is subject to change without notice. It should be consumed with this api endpoint and used in the user update endpoint, and should not be constructed by the client.

display_name
A textual description of the avatar record

id
‘attachment’ type only
the internal id of the attachment

content-type
‘attachment’ type only
the content-type of the attachment

filename
‘attachment’ type only
the filename of the attachment

size
‘attachment’ type only
the size of the attachment

Example Request:


curl 'http://<canvas>/api/v1/users/1/avatars.json' \ 
     -H "Authorization: Bearer <token>"
Example Response:


[
  {
    "type":"gravatar",
    "url":"https://secure.gravatar.com/avatar/2284...",
    "token":<opaque_token>,
    "display_name":"gravatar pic"
  },
  {
    "type":"attachment",
    "url":"https://<canvas>/images/thumbnails/12/gpLWJ...",
    "token":<opaque_token>,
    "display_name":"profile.jpg",
    "id":12,
    "content-type":"image/jpeg",
    "filename":"profile.jpg",
    "size":32649
  },
  {
    "type":"no_pic",
    "url":"https://<canvas>/images/dotted_pic.png",
    "token":<opaque_token>,
    "display_name":"no pic"
  }
]
List user page views PageViewsController#index

GET /api/v1/users/:user_id/page_views

Return the user’s page view history in json format, similar to the available CSV download. Pagination is used as described in API basics section. Page views are returned in descending order, newest to oldest.

API response field:

 interaction_seconds
The number of seconds the user actively interacted with the page. This is a best guess, using heuristics such as browser input events.

 url
The full canvas URL of the page view.

 user_agent
The browser identifier or other user agent that was used to make the request.

 controller
The Rails controller that processed the request.

 action
The action in the Rails controller that processed the request.

 context_type
The type of “context” of the request, e.g. Account or Course.

