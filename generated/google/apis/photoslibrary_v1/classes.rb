# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module PhotoslibraryV1
      
      # Request to add an enrichment to a specific album at a specific position.
      class AddEnrichmentToAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Specifies a position in an album.
        # Corresponds to the JSON property `albumPosition`
        # @return [Google::Apis::PhotoslibraryV1::AlbumPosition]
        attr_accessor :album_position
      
        # A new enrichment item to be added to an album, used by the
        # `albums.addEnrichment` call.
        # Corresponds to the JSON property `newEnrichmentItem`
        # @return [Google::Apis::PhotoslibraryV1::NewEnrichmentItem]
        attr_accessor :new_enrichment_item
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @album_position = args[:album_position] if args.key?(:album_position)
          @new_enrichment_item = args[:new_enrichment_item] if args.key?(:new_enrichment_item)
        end
      end
      
      # The enrichment item that's created.
      class AddEnrichmentToAlbumResponse
        include Google::Apis::Core::Hashable
      
        # An enrichment item.
        # Corresponds to the JSON property `enrichmentItem`
        # @return [Google::Apis::PhotoslibraryV1::EnrichmentItem]
        attr_accessor :enrichment_item
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @enrichment_item = args[:enrichment_item] if args.key?(:enrichment_item)
        end
      end
      
      # Representation of an album in Google Photos.
      # Albums are containers for media items. If an album has been shared by the
      # application, it contains an extra `shareInfo` property.
      class Album
        include Google::Apis::Core::Hashable
      
        # [Output only] A URL to the cover photo's bytes. This shouldn't be used as
        # is. Parameters should be appended to this URL before use. See the
        # [developer
        # documentation](https://developers.google.com/photos/library/guides/access-
        # media-items#base-urls)
        # for a complete list of supported parameters. For example,
        # `'=w2048-h1024'` sets the dimensions of the cover photo to have a width of
        # 2048 px and height of 1024 px.
        # Corresponds to the JSON property `coverPhotoBaseUrl`
        # @return [String]
        attr_accessor :cover_photo_base_url
      
        # [Output only] Identifier for the media item associated with the cover
        # photo.
        # Corresponds to the JSON property `coverPhotoMediaItemId`
        # @return [String]
        attr_accessor :cover_photo_media_item_id
      
        # [Ouput only] Identifier for the album. This is a persistent identifier that
        # can be used between sessions to identify this album.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # [Output only] True if you can create media items in this album.
        # This field is based on the scopes granted and permissions of the album. If
        # the scopes are changed or permissions of the album are changed, this field
        # is updated.
        # Corresponds to the JSON property `isWriteable`
        # @return [Boolean]
        attr_accessor :is_writeable
        alias_method :is_writeable?, :is_writeable
      
        # [Output only] The number of media items in the album.
        # Corresponds to the JSON property `mediaItemsCount`
        # @return [Fixnum]
        attr_accessor :media_items_count
      
        # [Output only] Google Photos URL for the album. The user needs to be signed
        # in to their Google Photos account to access this link.
        # Corresponds to the JSON property `productUrl`
        # @return [String]
        attr_accessor :product_url
      
        # Information about albums that are shared. This information is only included
        # if you created the album, it is shared and you have the sharing scope.
        # Corresponds to the JSON property `shareInfo`
        # @return [Google::Apis::PhotoslibraryV1::ShareInfo]
        attr_accessor :share_info
      
        # Name of the album displayed to the user in their Google Photos account.
        # This string shouldn't be more than 500 characters.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cover_photo_base_url = args[:cover_photo_base_url] if args.key?(:cover_photo_base_url)
          @cover_photo_media_item_id = args[:cover_photo_media_item_id] if args.key?(:cover_photo_media_item_id)
          @id = args[:id] if args.key?(:id)
          @is_writeable = args[:is_writeable] if args.key?(:is_writeable)
          @media_items_count = args[:media_items_count] if args.key?(:media_items_count)
          @product_url = args[:product_url] if args.key?(:product_url)
          @share_info = args[:share_info] if args.key?(:share_info)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Specifies a position in an album.
      class AlbumPosition
        include Google::Apis::Core::Hashable
      
        # Type of position, for a media or enrichment item.
        # Corresponds to the JSON property `position`
        # @return [String]
        attr_accessor :position
      
        # The enrichment item to which the position is relative to.
        # Only used when position type is AFTER_ENRICHMENT_ITEM.
        # Corresponds to the JSON property `relativeEnrichmentItemId`
        # @return [String]
        attr_accessor :relative_enrichment_item_id
      
        # The media item to which the position is relative to.
        # Only used when position type is AFTER_MEDIA_ITEM.
        # Corresponds to the JSON property `relativeMediaItemId`
        # @return [String]
        attr_accessor :relative_media_item_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @relative_enrichment_item_id = args[:relative_enrichment_item_id] if args.key?(:relative_enrichment_item_id)
          @relative_media_item_id = args[:relative_media_item_id] if args.key?(:relative_media_item_id)
        end
      end
      
      # Request to add media items to an album.
      class BatchAddMediaItemsToAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Identifiers of the MediaItems to be
        # added.
        # The maximum number of media items that can be added in one call is 50.
        # Corresponds to the JSON property `mediaItemIds`
        # @return [Array<String>]
        attr_accessor :media_item_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_item_ids = args[:media_item_ids] if args.key?(:media_item_ids)
        end
      end
      
      # Response for adding media items to an album.
      class BatchAddMediaItemsToAlbumResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Request to create one or more media items in a user's Google Photos library.
      # If an `albumid` is specified, the media items are also added to that album.
      # `albumPosition` is optional and can only be specified if an `albumId` is set.
      class BatchCreateMediaItemsRequest
        include Google::Apis::Core::Hashable
      
        # Identifier of the album where the media items are added. The media items
        # are also added to the user's library. This is an optional field.
        # Corresponds to the JSON property `albumId`
        # @return [String]
        attr_accessor :album_id
      
        # Specifies a position in an album.
        # Corresponds to the JSON property `albumPosition`
        # @return [Google::Apis::PhotoslibraryV1::AlbumPosition]
        attr_accessor :album_position
      
        # List of media items to be created.
        # Corresponds to the JSON property `newMediaItems`
        # @return [Array<Google::Apis::PhotoslibraryV1::NewMediaItem>]
        attr_accessor :new_media_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @album_id = args[:album_id] if args.key?(:album_id)
          @album_position = args[:album_position] if args.key?(:album_position)
          @new_media_items = args[:new_media_items] if args.key?(:new_media_items)
        end
      end
      
      # List of media items created.
      class BatchCreateMediaItemsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. List of media items created.
        # Corresponds to the JSON property `newMediaItemResults`
        # @return [Array<Google::Apis::PhotoslibraryV1::NewMediaItemResult>]
        attr_accessor :new_media_item_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @new_media_item_results = args[:new_media_item_results] if args.key?(:new_media_item_results)
        end
      end
      
      # Response to retrieve a list of media items.
      class BatchGetMediaItemsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. List of media items retrieved.
        # Note that even if the call to BatchGetMediaItems succeeds, there may have
        # been failures for some media items in the batch. These failures are
        # indicated in each
        # MediaItemResult.status.
        # Corresponds to the JSON property `mediaItemResults`
        # @return [Array<Google::Apis::PhotoslibraryV1::MediaItemResult>]
        attr_accessor :media_item_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_item_results = args[:media_item_results] if args.key?(:media_item_results)
        end
      end
      
      # Request to remove a list of media items from an album.
      class BatchRemoveMediaItemsFromAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Identifiers of the MediaItems to be
        # removed.
        # Must not contain repeated identifiers and cannot be empty. The maximum
        # number of media items that can be removed in one call is 50.
        # Corresponds to the JSON property `mediaItemIds`
        # @return [Array<String>]
        attr_accessor :media_item_ids
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_item_ids = args[:media_item_ids] if args.key?(:media_item_ids)
        end
      end
      
      # Response for successfully removing all specified media items from the album.
      class BatchRemoveMediaItemsFromAlbumResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # This filter allows you to return media items based on the content type.
      # It's possible to specify a list of categories to include, and/or a list of
      # categories to exclude. Within each list, the categories are combined with an
      # OR. <p>
      # The content filter `includedContentCategories`: [c1, c2, c3] would get media
      # items that contain (c1 OR c2 OR c3). <p>
      # The content filter `excludedContentCategories`: [c1, c2, c3] would NOT get
      # media items that contain (c1 OR c2 OR c3). <p>
      # You can also include some categories while excluding others, as in this
      # example: `includedContentCategories`: [c1, c2], `excludedContentCategories`:
      # [c3, c4] <p>
      # The previous example would get media items that contain (c1 OR c2) AND NOT
      # (c3 OR c4). A category that appears in `includedContentategories` must not
      # appear in `excludedContentCategories`.
      class ContentFilter
        include Google::Apis::Core::Hashable
      
        # The set of categories which are not to be included in the media item search
        # results. The items in the set are ORed. There's a maximum of 10
        # `excludedContentCategories` per request.
        # Corresponds to the JSON property `excludedContentCategories`
        # @return [Array<String>]
        attr_accessor :excluded_content_categories
      
        # The set of categories to be included in the media item search results.
        # The items in the set are ORed. There's a maximum of 10
        # `includedContentCategories` per request.
        # Corresponds to the JSON property `includedContentCategories`
        # @return [Array<String>]
        attr_accessor :included_content_categories
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @excluded_content_categories = args[:excluded_content_categories] if args.key?(:excluded_content_categories)
          @included_content_categories = args[:included_content_categories] if args.key?(:included_content_categories)
        end
      end
      
      # Information about the user who added the media item. Note that this
      # information is included only if the media item is within a shared album
      # created by your app and you have the sharing scope.
      class ContributorInfo
        include Google::Apis::Core::Hashable
      
        # Display name of the contributor.
        # Corresponds to the JSON property `displayName`
        # @return [String]
        attr_accessor :display_name
      
        # URL to the profile picture of the contributor.
        # Corresponds to the JSON property `profilePictureBaseUrl`
        # @return [String]
        attr_accessor :profile_picture_base_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @display_name = args[:display_name] if args.key?(:display_name)
          @profile_picture_base_url = args[:profile_picture_base_url] if args.key?(:profile_picture_base_url)
        end
      end
      
      # Request to create an album in Google Photos.
      class CreateAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Representation of an album in Google Photos.
        # Albums are containers for media items. If an album has been shared by the
        # application, it contains an extra `shareInfo` property.
        # Corresponds to the JSON property `album`
        # @return [Google::Apis::PhotoslibraryV1::Album]
        attr_accessor :album
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @album = args[:album] if args.key?(:album)
        end
      end
      
      # Represents a whole calendar date. Set `day` to 0 when only the month and year
      # are significant, for example, all of December 2018. Set `day` and `month` to 0
      # if only the year is significant, for example, the entire of 2018. Set `year`
      # to 0 when only the day and month are significant, for example, an anniversary
      # or birthday.
      # Unsupported: Setting all values to 0, only `month` to 0, or both `day` and `
      # year` to 0 at the same time.
      class Date
        include Google::Apis::Core::Hashable
      
        # Day of month. Must be from 1 to 31 and valid for the year and month, or 0 if
        # specifying a year/month where the day isn't significant.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of year. Must be from 1 to 12, or 0 if specifying a year without a
        # month and day.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of date. Must be from 1 to 9999, or 0 if specifying a date without
        # a year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # This filter defines the allowed dates or date ranges for the media returned.
      # It's possible to pick a set of specific dates and a set of date ranges.
      class DateFilter
        include Google::Apis::Core::Hashable
      
        # List of dates that match the media items' creation date. A maximum of
        # 5 dates can be included per request.
        # Corresponds to the JSON property `dates`
        # @return [Array<Google::Apis::PhotoslibraryV1::Date>]
        attr_accessor :dates
      
        # List of dates ranges that match the media items' creation date. A
        # maximum of 5 dates ranges can be included per request.
        # Corresponds to the JSON property `ranges`
        # @return [Array<Google::Apis::PhotoslibraryV1::DateRange>]
        attr_accessor :ranges
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dates = args[:dates] if args.key?(:dates)
          @ranges = args[:ranges] if args.key?(:ranges)
        end
      end
      
      # Defines a range of dates. Both dates must be of the same format. For more
      # information, see Date.
      class DateRange
        include Google::Apis::Core::Hashable
      
        # Represents a whole calendar date. Set `day` to 0 when only the month and year
        # are significant, for example, all of December 2018. Set `day` and `month` to 0
        # if only the year is significant, for example, the entire of 2018. Set `year`
        # to 0 when only the day and month are significant, for example, an anniversary
        # or birthday.
        # Unsupported: Setting all values to 0, only `month` to 0, or both `day` and `
        # year` to 0 at the same time.
        # Corresponds to the JSON property `endDate`
        # @return [Google::Apis::PhotoslibraryV1::Date]
        attr_accessor :end_date
      
        # Represents a whole calendar date. Set `day` to 0 when only the month and year
        # are significant, for example, all of December 2018. Set `day` and `month` to 0
        # if only the year is significant, for example, the entire of 2018. Set `year`
        # to 0 when only the day and month are significant, for example, an anniversary
        # or birthday.
        # Unsupported: Setting all values to 0, only `month` to 0, or both `day` and `
        # year` to 0 at the same time.
        # Corresponds to the JSON property `startDate`
        # @return [Google::Apis::PhotoslibraryV1::Date]
        attr_accessor :start_date
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @end_date = args[:end_date] if args.key?(:end_date)
          @start_date = args[:start_date] if args.key?(:start_date)
        end
      end
      
      # An enrichment item.
      class EnrichmentItem
        include Google::Apis::Core::Hashable
      
        # Identifier of the enrichment item.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
        end
      end
      
      # This filter defines the features that the media items should have.
      class FeatureFilter
        include Google::Apis::Core::Hashable
      
        # The set of features to be included in the media item search results.
        # The items in the set are ORed and may match any of the specified features.
        # Corresponds to the JSON property `includedFeatures`
        # @return [Array<String>]
        attr_accessor :included_features
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @included_features = args[:included_features] if args.key?(:included_features)
        end
      end
      
      # Filters that can be applied to a media item search.
      # If multiple filter options are specified, they're treated as AND with each
      # other.
      class Filters
        include Google::Apis::Core::Hashable
      
        # This filter allows you to return media items based on the content type.
        # It's possible to specify a list of categories to include, and/or a list of
        # categories to exclude. Within each list, the categories are combined with an
        # OR. <p>
        # The content filter `includedContentCategories`: [c1, c2, c3] would get media
        # items that contain (c1 OR c2 OR c3). <p>
        # The content filter `excludedContentCategories`: [c1, c2, c3] would NOT get
        # media items that contain (c1 OR c2 OR c3). <p>
        # You can also include some categories while excluding others, as in this
        # example: `includedContentCategories`: [c1, c2], `excludedContentCategories`:
        # [c3, c4] <p>
        # The previous example would get media items that contain (c1 OR c2) AND NOT
        # (c3 OR c4). A category that appears in `includedContentategories` must not
        # appear in `excludedContentCategories`.
        # Corresponds to the JSON property `contentFilter`
        # @return [Google::Apis::PhotoslibraryV1::ContentFilter]
        attr_accessor :content_filter
      
        # This filter defines the allowed dates or date ranges for the media returned.
        # It's possible to pick a set of specific dates and a set of date ranges.
        # Corresponds to the JSON property `dateFilter`
        # @return [Google::Apis::PhotoslibraryV1::DateFilter]
        attr_accessor :date_filter
      
        # If set, the results exclude media items that were not created by this app.
        # Defaults to false (all media items are returned). This field is ignored if
        # the photoslibrary.readonly.appcreateddata scope is used.
        # Corresponds to the JSON property `excludeNonAppCreatedData`
        # @return [Boolean]
        attr_accessor :exclude_non_app_created_data
        alias_method :exclude_non_app_created_data?, :exclude_non_app_created_data
      
        # This filter defines the features that the media items should have.
        # Corresponds to the JSON property `featureFilter`
        # @return [Google::Apis::PhotoslibraryV1::FeatureFilter]
        attr_accessor :feature_filter
      
        # If set, the results include media items that the user has archived.
        # Defaults to false (archived media items aren't included).
        # Corresponds to the JSON property `includeArchivedMedia`
        # @return [Boolean]
        attr_accessor :include_archived_media
        alias_method :include_archived_media?, :include_archived_media
      
        # This filter defines the type of media items to be returned, for example,
        # videos or photos. All the specified media types are treated as an OR when
        # used together.
        # Corresponds to the JSON property `mediaTypeFilter`
        # @return [Google::Apis::PhotoslibraryV1::MediaTypeFilter]
        attr_accessor :media_type_filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_filter = args[:content_filter] if args.key?(:content_filter)
          @date_filter = args[:date_filter] if args.key?(:date_filter)
          @exclude_non_app_created_data = args[:exclude_non_app_created_data] if args.key?(:exclude_non_app_created_data)
          @feature_filter = args[:feature_filter] if args.key?(:feature_filter)
          @include_archived_media = args[:include_archived_media] if args.key?(:include_archived_media)
          @media_type_filter = args[:media_type_filter] if args.key?(:media_type_filter)
        end
      end
      
      # Request to join a shared album on behalf of the user. This uses a shareToken
      # which can be acquired via the shareAlbum or listSharedAlbums calls.
      class JoinSharedAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Token to join the shared album on behalf of the user.
        # Corresponds to the JSON property `shareToken`
        # @return [String]
        attr_accessor :share_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @share_token = args[:share_token] if args.key?(:share_token)
        end
      end
      
      # Response to successfully joining the shared album on behalf of the user.
      class JoinSharedAlbumResponse
        include Google::Apis::Core::Hashable
      
        # Representation of an album in Google Photos.
        # Albums are containers for media items. If an album has been shared by the
        # application, it contains an extra `shareInfo` property.
        # Corresponds to the JSON property `album`
        # @return [Google::Apis::PhotoslibraryV1::Album]
        attr_accessor :album
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @album = args[:album] if args.key?(:album)
        end
      end
      
      # An object representing a latitude/longitude pair. This is expressed as a pair
      # of doubles representing degrees latitude and degrees longitude. Unless
      # specified otherwise, this must conform to the
      # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
      # standard</a>. Values must be within normalized ranges.
      class LatLng
        include Google::Apis::Core::Hashable
      
        # The latitude in degrees. It must be in the range [-90.0, +90.0].
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude in degrees. It must be in the range [-180.0, +180.0].
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
      
      # Request to leave a shared album on behalf of the user. This uses a shareToken
      # which can be acquired via the or listSharedAlbums or getAlbum calls.
      class LeaveSharedAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Token to leave the shared album on behalf of the user.
        # Corresponds to the JSON property `shareToken`
        # @return [String]
        attr_accessor :share_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @share_token = args[:share_token] if args.key?(:share_token)
        end
      end
      
      # Response to successfully leaving the shared album on behalf of the user.
      class LeaveSharedAlbumResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # List of albums requested.
      class ListAlbumsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. List of albums shown in the Albums tab of the user's Google
        # Photos app.
        # Corresponds to the JSON property `albums`
        # @return [Array<Google::Apis::PhotoslibraryV1::Album>]
        attr_accessor :albums
      
        # Output only. Token to use to get the next set of albums. Populated if
        # there are more albums to retrieve for this request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @albums = args[:albums] if args.key?(:albums)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List of all media items from the user's Google Photos library.
      class ListMediaItemsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. List of media items in the user's library.
        # Corresponds to the JSON property `mediaItems`
        # @return [Array<Google::Apis::PhotoslibraryV1::MediaItem>]
        attr_accessor :media_items
      
        # Output only. Token to use to get the next set of media items. Its presence
        # is the only reliable indicator of more media items being available in the
        # next request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_items = args[:media_items] if args.key?(:media_items)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # List of shared albums requested.
      class ListSharedAlbumsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. Token to use to get the next set of shared albums. Populated
        # if there are more shared albums to retrieve for this request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Output only. List of shared albums.
        # Corresponds to the JSON property `sharedAlbums`
        # @return [Array<Google::Apis::PhotoslibraryV1::Album>]
        attr_accessor :shared_albums
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @shared_albums = args[:shared_albums] if args.key?(:shared_albums)
        end
      end
      
      # Represents a physical location.
      class Location
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latlng`
        # @return [Google::Apis::PhotoslibraryV1::LatLng]
        attr_accessor :latlng
      
        # Name of the location to be displayed.
        # Corresponds to the JSON property `locationName`
        # @return [String]
        attr_accessor :location_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latlng = args[:latlng] if args.key?(:latlng)
          @location_name = args[:location_name] if args.key?(:location_name)
        end
      end
      
      # An enrichment containing a single location.
      class LocationEnrichment
        include Google::Apis::Core::Hashable
      
        # Represents a physical location.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::PhotoslibraryV1::Location]
        attr_accessor :location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
        end
      end
      
      # An enrichment containing a map, showing origin and destination locations.
      class MapEnrichment
        include Google::Apis::Core::Hashable
      
        # Represents a physical location.
        # Corresponds to the JSON property `destination`
        # @return [Google::Apis::PhotoslibraryV1::Location]
        attr_accessor :destination
      
        # Represents a physical location.
        # Corresponds to the JSON property `origin`
        # @return [Google::Apis::PhotoslibraryV1::Location]
        attr_accessor :origin
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @destination = args[:destination] if args.key?(:destination)
          @origin = args[:origin] if args.key?(:origin)
        end
      end
      
      # Representation of a media item (such as a photo or video) in Google Photos.
      class MediaItem
        include Google::Apis::Core::Hashable
      
        # A URL to the media item's bytes. This shouldn't be used as is. Parameters
        # should be appended to this URL before use. See the [developer
        # documentation](https://developers.google.com/photos/library/guides/access-
        # media-items#base-urls)
        # for a complete list of supported parameters. For example, `'=w2048-h1024'`
        # will set the dimensions of a media item of type photo to have a width of
        # 2048 px and height of 1024 px.
        # Corresponds to the JSON property `baseUrl`
        # @return [String]
        attr_accessor :base_url
      
        # Information about the user who added the media item. Note that this
        # information is included only if the media item is within a shared album
        # created by your app and you have the sharing scope.
        # Corresponds to the JSON property `contributorInfo`
        # @return [Google::Apis::PhotoslibraryV1::ContributorInfo]
        attr_accessor :contributor_info
      
        # Description of the media item. This is shown to the user in the item's
        # info section in the Google Photos app.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Filename of the media item. This is shown to the user in the item's info
        # section in the Google Photos app.
        # Corresponds to the JSON property `filename`
        # @return [String]
        attr_accessor :filename
      
        # Identifier for the media item. This is a persistent identifier that can be
        # used between sessions to identify this media item.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Metadata for a media item.
        # Corresponds to the JSON property `mediaMetadata`
        # @return [Google::Apis::PhotoslibraryV1::MediaMetadata]
        attr_accessor :media_metadata
      
        # MIME type of the media item. For example, `image/jpeg`.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        # Google Photos URL for the media item. This link is available to
        # the user only if they're signed in.
        # Corresponds to the JSON property `productUrl`
        # @return [String]
        attr_accessor :product_url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @base_url = args[:base_url] if args.key?(:base_url)
          @contributor_info = args[:contributor_info] if args.key?(:contributor_info)
          @description = args[:description] if args.key?(:description)
          @filename = args[:filename] if args.key?(:filename)
          @id = args[:id] if args.key?(:id)
          @media_metadata = args[:media_metadata] if args.key?(:media_metadata)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
          @product_url = args[:product_url] if args.key?(:product_url)
        end
      end
      
      # Result of retrieving a media item.
      class MediaItemResult
        include Google::Apis::Core::Hashable
      
        # Representation of a media item (such as a photo or video) in Google Photos.
        # Corresponds to the JSON property `mediaItem`
        # @return [Google::Apis::PhotoslibraryV1::MediaItem]
        attr_accessor :media_item
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::PhotoslibraryV1::Status]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_item = args[:media_item] if args.key?(:media_item)
          @status = args[:status] if args.key?(:status)
        end
      end
      
      # Metadata for a media item.
      class MediaMetadata
        include Google::Apis::Core::Hashable
      
        # Time when the media item was first created (not when it was uploaded to
        # Google Photos).
        # Corresponds to the JSON property `creationTime`
        # @return [String]
        attr_accessor :creation_time
      
        # Original height (in pixels) of the media item.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Metadata that is specific to a photo, such as, ISO, focal length and
        # exposure time. Some of these fields may be null or not included.
        # Corresponds to the JSON property `photo`
        # @return [Google::Apis::PhotoslibraryV1::Photo]
        attr_accessor :photo
      
        # Metadata that is specific to a video, for example, fps and processing status.
        # Some of these fields may be null or not included.
        # Corresponds to the JSON property `video`
        # @return [Google::Apis::PhotoslibraryV1::Video]
        attr_accessor :video
      
        # Original width (in pixels) of the media item.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @creation_time = args[:creation_time] if args.key?(:creation_time)
          @height = args[:height] if args.key?(:height)
          @photo = args[:photo] if args.key?(:photo)
          @video = args[:video] if args.key?(:video)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # This filter defines the type of media items to be returned, for example,
      # videos or photos. All the specified media types are treated as an OR when
      # used together.
      class MediaTypeFilter
        include Google::Apis::Core::Hashable
      
        # The types of media items to be included. This field should be populated
        # with only one media type. If you specify multiple media types, it results
        # in an error.
        # Corresponds to the JSON property `mediaTypes`
        # @return [Array<String>]
        attr_accessor :media_types
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_types = args[:media_types] if args.key?(:media_types)
        end
      end
      
      # A new enrichment item to be added to an album, used by the
      # `albums.addEnrichment` call.
      class NewEnrichmentItem
        include Google::Apis::Core::Hashable
      
        # An enrichment containing a single location.
        # Corresponds to the JSON property `locationEnrichment`
        # @return [Google::Apis::PhotoslibraryV1::LocationEnrichment]
        attr_accessor :location_enrichment
      
        # An enrichment containing a map, showing origin and destination locations.
        # Corresponds to the JSON property `mapEnrichment`
        # @return [Google::Apis::PhotoslibraryV1::MapEnrichment]
        attr_accessor :map_enrichment
      
        # An enrichment containing text.
        # Corresponds to the JSON property `textEnrichment`
        # @return [Google::Apis::PhotoslibraryV1::TextEnrichment]
        attr_accessor :text_enrichment
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location_enrichment = args[:location_enrichment] if args.key?(:location_enrichment)
          @map_enrichment = args[:map_enrichment] if args.key?(:map_enrichment)
          @text_enrichment = args[:text_enrichment] if args.key?(:text_enrichment)
        end
      end
      
      # New media item that's created in a user's Google Photos account.
      class NewMediaItem
        include Google::Apis::Core::Hashable
      
        # Description of the media item. This will be shown to the user in the item's
        # info section in the Google Photos app.
        # This string shouldn't be more than 1000 characters.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # A simple media item to be created in Google Photos via an upload token.
        # Corresponds to the JSON property `simpleMediaItem`
        # @return [Google::Apis::PhotoslibraryV1::SimpleMediaItem]
        attr_accessor :simple_media_item
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @simple_media_item = args[:simple_media_item] if args.key?(:simple_media_item)
        end
      end
      
      # Result of creating a new media item.
      class NewMediaItemResult
        include Google::Apis::Core::Hashable
      
        # Representation of a media item (such as a photo or video) in Google Photos.
        # Corresponds to the JSON property `mediaItem`
        # @return [Google::Apis::PhotoslibraryV1::MediaItem]
        attr_accessor :media_item
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `status`
        # @return [Google::Apis::PhotoslibraryV1::Status]
        attr_accessor :status
      
        # The upload token used to create this new media item.
        # Corresponds to the JSON property `uploadToken`
        # @return [String]
        attr_accessor :upload_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_item = args[:media_item] if args.key?(:media_item)
          @status = args[:status] if args.key?(:status)
          @upload_token = args[:upload_token] if args.key?(:upload_token)
        end
      end
      
      # Metadata that is specific to a photo, such as, ISO, focal length and
      # exposure time. Some of these fields may be null or not included.
      class Photo
        include Google::Apis::Core::Hashable
      
        # Aperture f number of the camera lens with which the photo was taken.
        # Corresponds to the JSON property `apertureFNumber`
        # @return [Float]
        attr_accessor :aperture_f_number
      
        # Brand of the camera with which the photo was taken.
        # Corresponds to the JSON property `cameraMake`
        # @return [String]
        attr_accessor :camera_make
      
        # Model of the camera with which the photo was taken.
        # Corresponds to the JSON property `cameraModel`
        # @return [String]
        attr_accessor :camera_model
      
        # Exposure time of the camera aperture when the photo was taken.
        # Corresponds to the JSON property `exposureTime`
        # @return [String]
        attr_accessor :exposure_time
      
        # Focal length of the camera lens with which the photo was taken.
        # Corresponds to the JSON property `focalLength`
        # @return [Float]
        attr_accessor :focal_length
      
        # ISO of the camera with which the photo was taken.
        # Corresponds to the JSON property `isoEquivalent`
        # @return [Fixnum]
        attr_accessor :iso_equivalent
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aperture_f_number = args[:aperture_f_number] if args.key?(:aperture_f_number)
          @camera_make = args[:camera_make] if args.key?(:camera_make)
          @camera_model = args[:camera_model] if args.key?(:camera_model)
          @exposure_time = args[:exposure_time] if args.key?(:exposure_time)
          @focal_length = args[:focal_length] if args.key?(:focal_length)
          @iso_equivalent = args[:iso_equivalent] if args.key?(:iso_equivalent)
        end
      end
      
      # Request to search for media items in a user's library.
      # If the album id is specified, this call will return the list of media items
      # in the album. If neither filters nor album id are
      # specified, this call will return all media items in a user's Google Photos
      # library.
      # If filters are specified, this call will return all media items in
      # the user's library that fulfill the filter criteria.
      # Filters and album id must not both be set, as this will result in an
      # invalid request.
      class SearchMediaItemsRequest
        include Google::Apis::Core::Hashable
      
        # Identifier of an album. If populated, lists all media items in
        # specified album. Can't set in conjunction with any filters.
        # Corresponds to the JSON property `albumId`
        # @return [String]
        attr_accessor :album_id
      
        # Filters that can be applied to a media item search.
        # If multiple filter options are specified, they're treated as AND with each
        # other.
        # Corresponds to the JSON property `filters`
        # @return [Google::Apis::PhotoslibraryV1::Filters]
        attr_accessor :filters
      
        # Maximum number of media items to return in the response. Fewer media items
        # might be returned than the specified number. The default `pageSize` is 25,
        # the maximum is 100.
        # Corresponds to the JSON property `pageSize`
        # @return [Fixnum]
        attr_accessor :page_size
      
        # A continuation token to get the next page of the results. Adding this to
        # the request returns the rows after the `pageToken`. The `pageToken` should
        # be the value returned in the `nextPageToken` parameter in the response to
        # the `searchMediaItems` request.
        # Corresponds to the JSON property `pageToken`
        # @return [String]
        attr_accessor :page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @album_id = args[:album_id] if args.key?(:album_id)
          @filters = args[:filters] if args.key?(:filters)
          @page_size = args[:page_size] if args.key?(:page_size)
          @page_token = args[:page_token] if args.key?(:page_token)
        end
      end
      
      # List of media items that match the search parameters.
      class SearchMediaItemsResponse
        include Google::Apis::Core::Hashable
      
        # Output only. List of media items that match the search parameters.
        # Corresponds to the JSON property `mediaItems`
        # @return [Array<Google::Apis::PhotoslibraryV1::MediaItem>]
        attr_accessor :media_items
      
        # Output only. Use this token to get the next set of media items. Its
        # presence is the only reliable indicator of more media items being available
        # in the next request.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @media_items = args[:media_items] if args.key?(:media_items)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Request to make an album shared in Google Photos.
      class ShareAlbumRequest
        include Google::Apis::Core::Hashable
      
        # Options that control the sharing of an album.
        # Corresponds to the JSON property `sharedAlbumOptions`
        # @return [Google::Apis::PhotoslibraryV1::SharedAlbumOptions]
        attr_accessor :shared_album_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @shared_album_options = args[:shared_album_options] if args.key?(:shared_album_options)
        end
      end
      
      # Response to successfully sharing an album.
      class ShareAlbumResponse
        include Google::Apis::Core::Hashable
      
        # Information about albums that are shared. This information is only included
        # if you created the album, it is shared and you have the sharing scope.
        # Corresponds to the JSON property `shareInfo`
        # @return [Google::Apis::PhotoslibraryV1::ShareInfo]
        attr_accessor :share_info
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @share_info = args[:share_info] if args.key?(:share_info)
        end
      end
      
      # Information about albums that are shared. This information is only included
      # if you created the album, it is shared and you have the sharing scope.
      class ShareInfo
        include Google::Apis::Core::Hashable
      
        # True if the user has joined the album. This is always true for the owner
        # of the shared album.
        # Corresponds to the JSON property `isJoined`
        # @return [Boolean]
        attr_accessor :is_joined
        alias_method :is_joined?, :is_joined
      
        # True if the user owns the album.
        # Corresponds to the JSON property `isOwned`
        # @return [Boolean]
        attr_accessor :is_owned
        alias_method :is_owned?, :is_owned
      
        # A token that can be used by other users to join this shared album via the
        # API.
        # Corresponds to the JSON property `shareToken`
        # @return [String]
        attr_accessor :share_token
      
        # A link to the album that's now shared on the Google Photos website and app.
        # Anyone with the link can access this shared album and see all of the items
        # present in the album.
        # Corresponds to the JSON property `shareableUrl`
        # @return [String]
        attr_accessor :shareable_url
      
        # Options that control the sharing of an album.
        # Corresponds to the JSON property `sharedAlbumOptions`
        # @return [Google::Apis::PhotoslibraryV1::SharedAlbumOptions]
        attr_accessor :shared_album_options
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_joined = args[:is_joined] if args.key?(:is_joined)
          @is_owned = args[:is_owned] if args.key?(:is_owned)
          @share_token = args[:share_token] if args.key?(:share_token)
          @shareable_url = args[:shareable_url] if args.key?(:shareable_url)
          @shared_album_options = args[:shared_album_options] if args.key?(:shared_album_options)
        end
      end
      
      # Options that control the sharing of an album.
      class SharedAlbumOptions
        include Google::Apis::Core::Hashable
      
        # True if the shared album allows collaborators (users who have joined
        # the album) to add media items to it. Defaults to false.
        # Corresponds to the JSON property `isCollaborative`
        # @return [Boolean]
        attr_accessor :is_collaborative
        alias_method :is_collaborative?, :is_collaborative
      
        # True if the shared album allows the owner and the collaborators (users
        # who have joined the album) to add comments to the album. Defaults to false.
        # Corresponds to the JSON property `isCommentable`
        # @return [Boolean]
        attr_accessor :is_commentable
        alias_method :is_commentable?, :is_commentable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_collaborative = args[:is_collaborative] if args.key?(:is_collaborative)
          @is_commentable = args[:is_commentable] if args.key?(:is_commentable)
        end
      end
      
      # A simple media item to be created in Google Photos via an upload token.
      class SimpleMediaItem
        include Google::Apis::Core::Hashable
      
        # Token identifying the media bytes that have been uploaded to Google.
        # Corresponds to the JSON property `uploadToken`
        # @return [String]
        attr_accessor :upload_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @upload_token = args[:upload_token] if args.key?(:upload_token)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # An enrichment containing text.
      class TextEnrichment
        include Google::Apis::Core::Hashable
      
        # Text for this enrichment item.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Request to unshare a shared album in Google Photos.
      class UnshareAlbumRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Response of a successful unshare of a shared album.
      class UnshareAlbumResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Metadata that is specific to a video, for example, fps and processing status.
      # Some of these fields may be null or not included.
      class Video
        include Google::Apis::Core::Hashable
      
        # Brand of the camera with which the video was taken.
        # Corresponds to the JSON property `cameraMake`
        # @return [String]
        attr_accessor :camera_make
      
        # Model of the camera with which the video was taken.
        # Corresponds to the JSON property `cameraModel`
        # @return [String]
        attr_accessor :camera_model
      
        # Frame rate of the video.
        # Corresponds to the JSON property `fps`
        # @return [Float]
        attr_accessor :fps
      
        # Processing status of the video.
        # Corresponds to the JSON property `status`
        # @return [String]
        attr_accessor :status
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @camera_make = args[:camera_make] if args.key?(:camera_make)
          @camera_model = args[:camera_model] if args.key?(:camera_model)
          @fps = args[:fps] if args.key?(:fps)
          @status = args[:status] if args.key?(:status)
        end
      end
    end
  end
end
