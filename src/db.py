from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

user_association_table = db.Table("user_association",
    db.Column("group_id", db.Integer, db.ForeignKey("group.id")),
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"))
) # connects classes to users users

friendship = db.Table("friend_association",
    db.Column("user_id", db.Integer, db.ForeignKey("user.id"), index = True),
    db.Column("friend_id", db.Integer, db.ForeignKey("user.id")),
    db.UniqueConstraint("user_id", "friend_id", name = "unique_friendship"))
#connects users and friends
    
class User(db.Model): #Students
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String, nullable = False)
    netid = db.Column(db.String, nullable = False)
    password = db.Column(db.String, nullable = False)
    groups = db.relationship("Group", secondary = user_association_table, back_populates = "users")
    messages = db.relationship("Message", cascade = "delete")
    friends = db.relationship("User", secondary = friendship, primaryjoin = id == friendship.c.user_id, secondaryjoin = id == friendship.c.friend_id)

    def __init__(self, **kwargs):
        self.name = kwargs.get("name", "")
        self.netid = kwargs.get("netid", "")
        self.password = kwargs.get("password","")
    
    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "netid": self.netid,
            "groups": [group.serialize2() for group in self.groups]
        }
    def serialize2(self):
        return{
            "id": self.id,
            "name": self.name
        }
    
    def serialize3(self): 
        return {
            "name": self.name,
            "netid": self.netid
        }

    def serialize_messages(self):
        return{
            "messages": [message.serialize_user() for message in self.messages]
        }
    
    def serialize_friends(self):
        return{
            "friends": [friend.serialize2() for friend in self.friends]
        }

class Group(db.Model):
    __tablename__ = "group"
    id = db.Column(db.Integer, primary_key = True)
    class_name = db.Column(db.String, nullable = False)
    description = db.Column(db.String, nullable = False)
    location = db.Column(db.String, nullable = False)
    time = db.Column(db.String, nullable = False)
    users = db.relationship("User", secondary = user_association_table, back_populates = "groups")
    messages = db.relationship("Message", cascade = "delete")

    def __init__(self, **kwargs):
        self.description = kwargs.get("description", "")
        self.location = kwargs.get("location", "")
        self.time = kwargs.get("time", 0)
        self.class_name = kwargs.get("class_name","")
    
    def serialize(self):
        return {
            "id": self.id,
            "description": self.description,
            "location": self.location,
            "time": self.time,
            "users": [user.serialize3() for user in self.users]
        }
    def serialize2(self):
        return{
            "id": self.id,
            "class_name": self.class_name,
            "description": self.description,
            "location": self.location,
            "time": self.time
        }
    
    def serialize_messages(self):
        return{
            "messages": [message.serialize_group() for message in self.messages]
        }

class Message(db.Model):
    __tablename__ = 'message'
    id = db.Column(db.Integer, primary_key = True)
    description = db.Column(db.String, nullable = False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'),nullable = False)
    group_id = db.Column(db.Integer, db.ForeignKey('group.id'),nullable = False)

    def __init__(self,**kwargs):
        self.description = kwargs.get("description","")
        self.user_id = kwargs.get("user_id")
        self.group_id = kwargs.get("group_id")

    def serialize_user(self):
        group = Group.query.filter_by(id = self.group_id).first()
        return {
            "id": self.id,
            "description": self.description,
            "group": group.class_name,
            "group_id": self.group_id
        }

    def serialize_group(self):
        user = User.query.filter_by(id = self.user_id).first()
        return {
            "id":  self.id,
            "description": self.description,
            "user": user.name,
            "user_id": self.user_id,
        }