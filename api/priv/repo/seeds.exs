# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     HomeImprovement.Repo.insert!(%HomeImprovement.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import HomeImprovement.{AccountsFactory, CoursesFactory}

{:ok, [user: user]} = create_user()
{:ok, [user: user2]} = create_user()

{:ok, [course: course]} = create_course(user: user)
{:ok, [course: course2]} = create_course(user: user2)

{:ok, [lesson: _course_lesson]} = create_lesson(user: user, course: course)
{:ok, [lesson: _course_lesson2]} = create_lesson(user: user, course: course)

{:ok, [lesson: _course2_lesson]} = create_lesson(user: user2, course: course2)
{:ok, [lesson: _course2_lesson2]} = create_lesson(user: user2, course: course2)
