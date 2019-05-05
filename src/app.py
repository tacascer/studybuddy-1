import json
from db import db, User, Group, Message
from flask import Flask, request

app = Flask(__name__)
db_filename = "todo.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

db.init_app(app)
with app.app_context():
    db.create_all()

@app.route('/')
def root():
    return """Server is successfully deployed! If you can see this message,
    that means that the app backend code is functional!"""

@app.route("/api/groups/")
def get_all_groups():
    groups = Group.query.all()
    res = {
        "success": True,
        "data": [group.serialize2() for group in groups]
    }
    return json.dumps(res), 200 # 200 means success

@app.route("/api/groups/", methods = ["POST"])
def create_group():
    post_body = json.loads(request.data)

    group = Group(
        class_name = post_body.get("class_name"),
        description = post_body.get("description"),
        location = post_body.get("location"),
        time = post_body.get("time"),
    )
    db.session.add(group)
    db.session.commit()
    return json.dumps({"success": True, "data": group.serialize2()}), 201

@app.route("/api/group/<int:id>/")
def get_group(id):
    group = Group.query.filter_by(id = id).first()
    if group is None:
        return json.dumps({"success": False, "error": "Group not found..."}), 404
    return json.dumps({"success": True, "data": group.serialize2()}), 200

@app.route("/api/group/<int:id>/", methods = ["DELETE"])
def delete_group(id):
    group = Group.query.filter_by(id = id).first()
    if group is None:
        return json.dumps({"success": False, "error": "Group not found..."}), 404
    db.session.delete(group)
    db.session.commit()
    return json.dumps({'success': True, 'data': group.serialize2()}), 200

@app.route("/api/users/")
def get_all_users():
    users = User.query.all()
    res = {
        "success": True,
        "data": [user.serialize() for user in users]
    }
    return json.dumps(res), 200

@app.route("/api/users/", methods = ["POST"])
def create_user():
    post_body = json.loads(request.data)
    user = User(
        name = post_body.get("name"),
        netid = post_body.get("netid"),
        password = post_body.get("password")
    )
    db.session.add(user)
    db.session.commit()
    return json.dumps({"success": True, "data": user.serialize()}), 201

@app.route("/api/user/login/", methods = ["POST"])
def log_in_user():
    post_body = json.loads(request.data)
    user = User.query.filter_by(netid = post_body.get("netid")).first()
    if user is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404
    if (user.password == post_body.get("password")):
        return json.dumps({"success": True, "data": user.serialize()}), 200
    return json.dumps({"success": False, "error": "Wrong password"}), 404

@app.route("/api/user/<int:user_id>/")
def get_user(user_id):
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404
    return json.dumps({"success": True, "data": user.serialize()}), 200

@app.route("/api/user/<int:user_id>/", methods = ["DELETE"])
def delete_user(user_id):
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404

    db.session.delete(user)
    db.session.commit()
    return json.dumps({'success': True, 'data': user.serialize()}), 200

@app.route("/api/user/<int:user_id>/group/<int:group_id>/add/", methods = ["POST"])
def add_user_to_group(user_id, group_id):
    group = Group.query.filter_by(id = group_id).first()
    if group is None:
        return json.dumps({"success": False, "error": "Group does not exist!"}), 404
    user = User.query.filter_by(id = user_id).first()
    group.users.append(user)
    db.session.commit()
    return json.dumps({"success": True, "data": group.serialize2()}), 201

@app.route("/api/group/<int:group_id>/info/")
def get_more_info_for_group(group_id):
    group = Group.query.filter_by(id = group_id).first()
    if group is None:
        return json.dumps({"success": False, "error": "Group not found..."}), 404
    return json.dumps({"success": True, "data": group.serialize()}), 200

@app.route("/api/user/<int:user_id>/messages/") 
def show_all_messages_of_user(user_id):
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404
    return json.dumps({"success": True, "data": user.serialize_messages()}), 200

@app.route("/api/group/<int:group_id>/messages/")
def show_all_messages_of_group(group_id):
    group = Group.query.filter_by(id = group_id).first()
    if group is None:
        return json.dumps({"success": False, "error": "Group does not exist!"}), 404
    return json.dumps({"success": True, "data": group.serialize_messages()}), 200

@app.route("/api/message/<int:message_id>/")
def show_specific_message(message_id):
    message = Message.query.filter_by(id = message_id).first()
    if message is None:
        return json.dumps({"success": False, "error": "Message does not exist!"}), 404
    return json.dumps({"success": True, "data": message.serialize_group()}), 200

@app.route("/api/user/<int:user_id>/group/<int:group_id>/messages/", methods = ["POST"])
def post_message_to_group(user_id, group_id):
    group = Group.query.filter_by(id = group_id).first()
    if group is None:
        return json.dumps({"success": False, "error": "Group not found..."}), 404
    post_body = json.loads(request.data)
    message = Message(
        user_id = user_id,
        group_id = group_id,
        description = post_body.get("description")
    )
    db.session.add(message)
    db.session.commit()
    return json.dumps({'success': True, 'data': message.serialize_group()}), 201

@app.route("/api/user/<int:user_id>/message/<int:message_id>/", methods = ["DELETE"])
def delete_message_from_user(user_id, message_id):
    user = User.query.filter_by(id = user_id).first() 
    if user is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404
    message = Message.query.filter_by(id = message_id).first()
    if message is None:
        return json.dumps({"success": False, "error": "Message does not exist!"}), 404
    
    db.session.delete(message)
    db.session.commit()
    return json.dumps({'success': True, 'data': message.serialize_group()}), 200

@app.route("/api/user/<int:user_id>/friends/")
def show_friends(user_id):
    user = User.query.filter_by(id = user_id).first()
    if user is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404
    return json.dumps({'success': True, 'data': user.serialize_friends()}), 200

# user1 adds user2 to his/her own friend list, but does not add user1 to user2's list.
@app.route("/api/user/<int:user_id1>/<int:user_id2>/add/", methods = ["POST"])
def add_friend(user_id1, user_id2):
    if user_id1 == user_id2:
        return json.dumps({"success": False, "error": "Can't add yourself!"}), 404
    
    user1 = User.query.filter_by(id = user_id1).first()
    if user1 is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404

    user2 = User.query.filter_by(id = user_id2).first()
    if user2 is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404
    
    if user2 not in user1.friends:
        user1.friends.append(user2)
        db.session.commit()
        return json.dumps({'success': True, 'data': user1.serialize_friends()}), 201
    return json.dumps({"success": False, "error": "Already friends with this person!"}), 404

# Removes user2 from user1's friend list, not the other way around.
@app.route("/api/user/<int:user_id1>/<int:user_id2>/remove/", methods = ["DELETE"])
def delete_friend(user_id1,user_id2):
    if user_id1 == user_id2:
        return json.dumps({"success": False, "error": "Are you Thanos?!"}), 404
    
    user1 = User.query.filter_by(id = user_id1).first()
    if user1 is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404

    user2 = User.query.filter_by(id = user_id2).first()
    if user2 is None:
        return json.dumps({"success": False, "error": "User does not exist!"}), 404

    if user2 in user1.friends:
        user1.friends.remove(user2)
        db.session.commit()
        return json.dumps({'success': True, 'data': user1.serialize_friends()}), 200
    return json.dumps({"success": False, "error": "Not friends with this person!"}), 404
    
if __name__ == "__main__": 
    app.run(host = "0.0.0.0", port = 5000, debug = True)