namespace Nikeza.Server.Models

open System

[<CLIMutable>]
type Profile = {
    ProfileId: int
    FirstName: string
    LastName: string
    Email: string
    ImageUrl: string
    Bio: string
    Created: DateTime
}

[<CLIMutable>]
type FollowRequest = { SubscriberId: int; ProviderId: int }

[<CLIMutable>]
type UnsubscribeRequest = { SubscriberId: int; ProviderId:   int }

[<CLIMutable>]
type FeatureLinkRequest = { LinkId: int; IsFeatured: bool }

[<CLIMutable>]
type UpdateProfileRequest = {
    ProviderId: int
    Bio:        string
    Email:      string
}

[<CLIMutable>]
type LinksRequest = { ProviderId: int }

type Command =
    | Follow        of FollowRequest
    | Unsubscribe   of UnsubscribeRequest
    | FeatureLink   of FeatureLinkRequest
    | UpdateProfile of UpdateProfileRequest

type Request =
    | GetLinks         of LinksRequest
    | GetFollowers     of Profile
    | GetSubscriptions of Profile