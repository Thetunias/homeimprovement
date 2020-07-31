defmodule HomeImprovement.CoursesTest do
  use HomeImprovement.DataCase

  import HomeImprovement.AccountsFactory,
    only: [
      create_user: 1
    ]

  import HomeImprovement.CoursesFactory,
    only: [
      create_course: 1
    ]

  alias HomeImprovement.Courses
  alias HomeImprovement.Courses.Course

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
end
