json.id @author.id
json.username @author.username
json.name @author.name
json.lastname @author.lastname
json.email @author.email
json.has_password @author.encrypted_password.present?  
json.created_at @author.created_at.strftime("%Y-%m-%dT%H:%M:%SZ")
json.updated_at @author.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")
