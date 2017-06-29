module Controls.ContentProviderTopicContentTypeLinks exposing (..)

import Settings exposing (..)
import Domain.Core exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onCheck, onInput)


type alias Model =
    ContentProvider



-- UPDATE


type Msg
    = None



-- | ToggleAll Bool
-- | Toggle ( Topic, Bool )
-- update : Msg -> Model -> Model
-- update msg model =
--     case msg of
--         Toggle ( topic, include ) ->
--             ( topic, include ) |> toggleFilter model
--         ToggleAll include ->
--             include |> toggleAllFilter model
-- VIEW


view : Model -> Topic -> ContentType -> Html Msg
view model topic contentType =
    let
        ( topics, links ) =
            ( model.topics, model.links )

        posts =
            links |> getPosts contentType |> List.filter (\l -> hasMatch topic l.topics)
    in
        table []
            [ tr []
                [ td [] [ h2 [] [ text <| "All " ++ (contentType |> contentTypeToText) ] ] ]
            , tr []
                [ td [] [ div [] <| List.map (\link -> a [ href <| getUrl link.url ] [ text <| getTitle link.title, br [] [] ]) posts ]
                ]
            ]



-- -- REMOVE DUPLICATED FUNCTION ! ! !
-- toCheckbox : Topic -> Html Msg
-- toCheckbox topic =
--     div []
--         [ input [ type_ "checkbox", checked True, onCheck (\b -> Toggle ( topic, b )) ] []
--         , label [] [ text <| getTopic topic ]
--         ]
-- toggleFilter : Model -> ( Topic, Bool ) -> Model
-- toggleFilter model ( topic, include ) =
--     let
--         toggleTopic contentType links =
--             if include then
--                 List.append (model.profile.id |> runtime.topicLinks topic contentType) links
--             else
--                 links |> List.filter (\link -> not (link.topics |> hasMatch topic))
--         links =
--             model.links
--         newState =
--             { model
--                 | showAll = False
--                 , links =
--                     { answers = links.answers |> toggleTopic Answer
--                     , articles = links.articles |> toggleTopic Article
--                     , videos = links.videos |> toggleTopic Video
--                     , podcasts = links.podcasts |> toggleTopic Podcast
--                     }
--             }
--     in
--         newState
-- toggleAllFilter : Model -> Bool -> Model
-- toggleAllFilter model include =
--     let
--         contentProvider =
--             model
--         newState =
--             if not include then
--                 { contentProvider | showAll = False, links = initLinks }
--             else
--                 { contentProvider | showAll = True, links = contentProvider.profile.id |> runtime.links }
--     in
--         newState
