json.extract! house, :id, :name, :mascot, :head, :element, :founder, :created_at, :updated_at
json.student_count house.students.count
json.url house_url(house, format: :json)
json.students house.students, partial: "students/student", as: :student
