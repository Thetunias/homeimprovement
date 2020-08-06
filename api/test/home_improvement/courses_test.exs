defmodule HomeImprovement.CoursesTest do
  use HomeImprovement.DataCase

  import HomeImprovement.AccountsFactory,
    only: [
      create_user: 1
    ]

  import HomeImprovement.CoursesFactory,
    only: [
      create_course: 1,
      create_lesson: 1
    ]

  alias HomeImprovement.Courses
  alias HomeImprovement.Courses.{Course, Lesson}

  describe ".list_courses/0" do
    setup [:create_user, :create_course]

    test "returns all courses", %{course: course} do
      assert Courses.list_courses() == [course]
    end
  end

  describe ".get_course!/1" do
    setup [:create_user, :create_course]

    test "returns the course with given id", %{course: course} do
      assert Courses.get_course!(course.id) == course
    end
  end

  describe ".get_course/1" do
    setup [:create_user, :create_course]

    test "returns the course with given id", %{course: course} do
      assert Courses.get_course(course.id) == course
    end

    test "returns nil with invalid id" do
      assert Courses.get_course(0) == nil
    end
  end

  describe ".create_course/1" do
    setup [:create_user]

    test "creates a course", %{user: user} do
      assert {:ok, %Course{} = course} =
               Courses.create_course(%{name: "Gardening", id_user_creator: user.id})

      assert course.name == "Gardening"
    end

    test "returns error changeset with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_course(%{})
    end
  end

  describe ".update_course/2" do
    setup [:create_user, :create_course]

    test "updates the course", %{course: course} do
      assert {:ok, %Course{} = course} = Courses.update_course(course, %{name: "Cooking"})
      assert course.name == "Cooking"
    end

    test "returns error changeset with invalid data", %{course: course} do
      assert {:error, %Ecto.Changeset{}} = Courses.update_course(course, %{name: 42})
      assert course == Courses.get_course!(course.id)
    end
  end

  describe ".delete_course/1" do
    setup [:create_user, :create_course]

    test "deletes the course", %{course: course} do
      assert {:ok, %Course{}} = Courses.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_course!(course.id) end
    end
  end

  describe ".change_course/1" do
    setup [:create_user, :create_course]

    test "returns a course changeset", %{course: course} do
      assert %Ecto.Changeset{} = Courses.change_course(course)
    end
  end

  describe "list_lessons/0 " do
    setup [:create_user, :create_course, :create_lesson]

    test "returns all lessons", %{lesson: lesson} do
      assert Courses.list_lessons() == [lesson]
    end
  end

  describe "get_lesson!/1" do
    setup [:create_user, :create_course, :create_lesson]

    test "returns the lesson with given id", %{lesson: lesson} do
      assert Courses.get_lesson!(lesson.id) == lesson
    end
  end

  describe ".get_lesson/1" do
    setup [:create_user, :create_course, :create_lesson]

    test "returns the lesson with given id", %{lesson: lesson} do
      assert Courses.get_lesson(lesson.id) == lesson
    end

    test "returns nil with invalid id" do
      assert Courses.get_lesson(0) == nil
    end
  end

  describe "create_lesson/1 " do
    setup [:create_user, :create_course]

    test "creates a lesson", %{user: user, course: course} do
      assert {:ok, %Lesson{} = lesson} =
               Courses.create_lesson(%{
                 id_user_creator: user.id,
                 id_course: course.id,
                 name: "Tools 101",
                 markup: "Let's learn about the tools you'll need."
               })

      assert lesson.name == "Tools 101"
      assert lesson.markup == "Let's learn about the tools you'll need."
    end

    test "returns error changeset with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Courses.create_lesson(%{})
    end
  end

  describe "update_lesson/2 " do
    setup [:create_user, :create_course, :create_lesson]

    test "updates the lesson", %{lesson: lesson} do
      assert {:ok, %Lesson{} = lesson} =
               Courses.update_lesson(lesson, %{
                 name: "Seeds 101",
                 markup: "Let's get to know about seeds."
               })

      assert lesson.name == "Seeds 101"
      assert lesson.markup == "Let's get to know about seeds."
    end

    test "returns error changeset with invalid data", %{lesson: lesson} do
      assert {:error, %Ecto.Changeset{}} =
               Courses.update_lesson(lesson, %{
                 name: 12,
                 markup: true
               })

      assert lesson == Courses.get_lesson!(lesson.id)
    end
  end

  describe "delete_lesson/1 " do
    setup [:create_user, :create_course, :create_lesson]

    test "deletes the lesson", %{lesson: lesson} do
      assert {:ok, %Lesson{}} = Courses.delete_lesson(lesson)
      assert_raise Ecto.NoResultsError, fn -> Courses.get_lesson!(lesson.id) end
    end
  end

  describe "change_lesson/1 " do
    setup [:create_user, :create_course, :create_lesson]

    test "returns a lesson changeset", %{lesson: lesson} do
      assert %Ecto.Changeset{} = Courses.change_lesson(lesson)
    end
  end
end
