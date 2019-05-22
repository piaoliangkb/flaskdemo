from app.models import db, Role

if __name__ == "__main__":
    db.drop_off()
    db.create_all()
    Role.insert_roles()