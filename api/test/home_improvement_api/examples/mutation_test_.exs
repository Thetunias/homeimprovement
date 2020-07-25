defmodule HomeImprovementApi.Examples.MutationTest do
  use HomeImprovementApi.DataCase

  import HomeImprovement.Factories.Examples,
    only: [
      create_example: 1
    ]

  describe "create_example" do
    setup [:create_example]

    test "creates an example if parameters are valid" do
      {:ok, %{data: %{"create_example" => payload}}} =
        run(
          mutation(:create_example),
          variables: %{
            "input" => %{
              "text" => "new example"
            }
          }
        )

      assert payload["example"]["text"] == "new example"
      assert payload["example"]["date_inserted"]
      assert payload["example"]["date_updated"]
    end

    test "validates parameters", %{example: example} do
      {:ok, %{data: %{"create_example" => payload}}} =
        run(
          mutation(:create_example),
          variables: %{
            "input" => %{
              "text" => example.text
            }
          }
        )

      assert payload["example"] == nil

      assert payload["errors"] == [
               %{
                 "field" => "text",
                 "errors" => [%{"type" => "unique", "message" => "has already been taken"}]
               }
             ]
    end
  end

  describe "update_example" do
    setup [:create_example]

    test "updates an example if parameters are valid", %{example: example} do
      {:ok, %{data: %{"update_example" => payload}}} =
        run(
          mutation(:update_example),
          variables: %{
            "input" => %{
              "id" => example.id,
              "text" => "updated example"
            }
          }
        )

      assert payload["example"]["text"] == "updated example"
      assert payload["example"]["date_inserted"]
      assert payload["example"]["date_updated"]

      updated_example = Examples.get_example!(example.id)

      assert updated_example["text"] == "updated_example"
    end

    test "validates parameters", %{example: example} do
      {:ok, %{data: %{"update_example" => payload}}} =
        run(
          mutation(:update_example),
          variables: %{
            "input" => %{
              "id" => example.id,
              "text" => true
            }
          }
        )

      assert payload["example"] == nil

      assert payload["errors"] == [
               %{
                 "field" => "text",
                 "errors" => [%{"type" => "unique", "message" => "has already been taken"}]
               }
             ]
    end
  end

  describe "delete_example" do
    setup [:create_example]

    test "deletes an example if parameters are valid", %{example: example} do
      {:ok, %{data: %{"delete_example" => payload}}} =
        run(
          mutation(:delete_example),
          variables: %{
            "input" => %{
              "id" => example.id
            }
          }
        )

      assert payload["example"]["text"] == example.text
      assert payload["example"]["date_inserted"]
      assert payload["example"]["date_updated"]

      assert Examples.get_example(example.id) == nil
    end

    test "validates parameters" do
      {:ok, %{data: %{"delete_example" => payload}}} =
        run(
          mutation(:delete_example),
          variables: %{
            "input" => %{
              "id" => 0
            }
          }
        )

      assert payload["example"] == nil

      assert payload["errors"] == [
               %{
                 "field" => "id",
                 "errors" => [%{"type" => "unique", "message" => "has already been taken"}]
               }
             ]
    end
  end
end
