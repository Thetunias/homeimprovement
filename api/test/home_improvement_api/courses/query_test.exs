defmodule HomeImprovementApi.Courses.QueryTest do
  use HomeImprovementApi.DataCase

  import HomeImprovement.AccountsFactory,
    only: [
      create_user: 1
    ]

  import HomeImprovement.CoursesFactory,
    only: [
      create_course: 1,
      create_lesson: 1
    ]

  describe "course" do
    setup [:create_user, :create_course]

    test "returns course with id", %{course: course} do
      {:ok, %{data: data}} = run(query(:course), variables: %{"id" => course.id})

      assert data["course"]["name"] == course.name
      assert data["course"]["date_inserted"]
      assert data["course"]["date_updated"]
    end

    test "returns null if given invalid id" do
      {:ok, %{data: data}} = run(query(:course), variables: %{"id" => 0})
      assert data["course"] == nil
    end
  end

  describe "courses" do
    setup [:create_user, :create_course]

    test "returns all courses", %{course: course} do
      {:ok, %{data: data}} = run(query(:courses))

      [returned_course] = data["courses"]

      assert returned_course["name"] == course.name
      assert returned_course["date_inserted"]
      assert returned_course["date_updated"]
    end
  end

  describe "lesson" do
    setup [:create_user, :create_course, :create_lesson]

    test "returns lesson with id", %{lesson: lesson} do
      {:ok, %{data: data}} = run(query(:lesson), variables: %{"id" => lesson.id})

      assert data["lesson"]["name"] == lesson.name
      assert data["lesson"]["markup"] == lesson.markup
      assert data["lesson"]["id_parent"] == nil
      assert data["lesson"]["id_course"]
      assert data["lesson"]["id_user_creator"]
      assert data["lesson"]["date_inserted"]
      assert data["lesson"]["date_updated"]
    end

    test "returns null if given invalid id" do
      {:ok, %{data: data}} = run(query(:lesson), variables: %{"id" => 0})
      assert data["lesson"] == nil
    end
  end
end
