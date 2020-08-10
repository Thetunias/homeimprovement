defmodule HomeImprovementApi.Courses.MutationTest do
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

  describe "create_course" do
    setup [:create_user, :create_course]

    test "creates a course if parameters are valid", %{user: user} do
      {:ok, %{data: %{"create_course" => payload}}} =
        run(mutation(:create_course),
          variables: %{
            "input" => %{
              "id_user_creator" => user.id,
              "name" => "Gardening"
            }
          }
        )

      refute payload["errors"]
      assert payload["course"]["name"] == "Gardening"
      assert payload["course"]["date_inserted"]
      assert payload["course"]["date_updated"]
    end

    test "validates parameters", %{user: user, course: course} do
      {:ok, %{data: %{"create_course" => payload}}} =
        run(mutation(:create_course),
          variables: %{
            "input" => %{
              "id_user_creator" => user.id,
              "name" => course.name
            }
          }
        )

      refute payload["course"]

      assert payload["errors"] == [
               %{
                 "field" => "name",
                 "errors" => [%{"type" => "unique", "message" => "has already been taken"}]
               }
             ]
    end
  end

  describe "create_lesson" do
    setup [:create_user, :create_course, :create_lesson]

    test "creates a lesson if parameters are valid", %{user: user, course: course} do
      {:ok, %{data: %{"create_lesson" => payload}}} =
        run(mutation(:create_lesson),
          variables: %{
            "input" => %{
              "id_user_creator" => user.id,
              "name" => "Gardening",
              "id_course" => course.id
            }
          }
        )

      refute payload["errors"]
      assert payload["lesson"]["name"] == "Gardening"
      assert payload["lesson"]["markup"]
      assert payload["lesson"]["date_inserted"]
      assert payload["lesson"]["date_updated"]
    end

    test "validates parameters", %{user: user, course: course, lesson: lesson} do
      {:ok, %{data: %{"create_lesson" => payload}}} =
        run(mutation(:create_lesson),
          variables: %{
            "input" => %{
              "id_user_creator" => user.id,
              "name" => lesson.name,
              "id_course" => course.id
            }
          }
        )

      refute payload["lesson"]

      assert payload["errors"] == [
               %{
                 "field" => "name",
                 "errors" => [%{"type" => "unique", "message" => "has already been taken"}]
               }
             ]
    end
  end
end
