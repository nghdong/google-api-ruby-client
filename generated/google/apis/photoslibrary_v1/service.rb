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

require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module PhotoslibraryV1
      # Photos Library API
      #
      # Manage photos, videos, and albums in Google Photos
      #
      # @example
      #    require 'google/apis/photoslibrary_v1'
      #
      #    Photoslibrary = Google::Apis::PhotoslibraryV1 # Alias the module
      #    service = Photoslibrary::PhotosLibraryService.new
      #
      # @see https://developers.google.com/photos/
      class PhotosLibraryService < Google::Apis::Core::BaseService
        # @return [String]
        #  API key. Your API key identifies your project and provides you with API access,
        #  quota, and reports. Required unless you provide an OAuth 2.0 token.
        attr_accessor :key

        # @return [String]
        #  Available to use for quota purposes for server-side applications. Can be any
        #  arbitrary string assigned to a user, but should not exceed 40 characters.
        attr_accessor :quota_user

        def initialize
          super('https://photoslibrary.googleapis.com/', '')
          @batch_path = 'batch'
        end
        
        # Adds an enrichment at a specified position in a defined album.
        # @param [String] album_id
        #   Identifier of the album where the enrichment is to be added.
        # @param [Google::Apis::PhotoslibraryV1::AddEnrichmentToAlbumRequest] add_enrichment_to_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::AddEnrichmentToAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::AddEnrichmentToAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def add_enrichment_to_album(album_id, add_enrichment_to_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/albums/{+albumId}:addEnrichment', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::AddEnrichmentToAlbumRequest::Representation
          command.request_object = add_enrichment_to_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::AddEnrichmentToAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::AddEnrichmentToAlbumResponse
          command.params['albumId'] = album_id unless album_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Adds one or more media items in a user's Google Photos library to
        # an album. The media items and albums must have been created by the
        # developer via the API.
        # Media items are added to the end of the album. If multiple media items are
        # given, they are added in the order specified in this call.
        # Each album can contain up to 20,000 media items.
        # Only media items that are in the user's library can be added to an
        # album. For albums that are shared, the album must either be owned by the
        # user or the user must have joined the album as a collaborator.
        # Partial success is not supported. The entire request will fail if an
        # invalid media item or album is specified.
        # @param [String] album_id
        #   Identifier of the Album that the
        #   media items are added to.
        # @param [Google::Apis::PhotoslibraryV1::BatchAddMediaItemsToAlbumRequest] batch_add_media_items_to_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::BatchAddMediaItemsToAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::BatchAddMediaItemsToAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_add_media_items_to_album(album_id, batch_add_media_items_to_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/albums/{+albumId}:batchAddMediaItems', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::BatchAddMediaItemsToAlbumRequest::Representation
          command.request_object = batch_add_media_items_to_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::BatchAddMediaItemsToAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::BatchAddMediaItemsToAlbumResponse
          command.params['albumId'] = album_id unless album_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Removes one or more media items from a specified album. The media items and
        # the album must have been created by the developer via the API.
        # For albums that are shared, this action is only supported for media items
        # that were added to the album by this user, or for all media items if the
        # album was created by this user.
        # Partial success is not supported. The entire request will fail and no
        # action will be performed on the album if an invalid media item or album is
        # specified.
        # @param [String] album_id
        #   Identifier of the Album that the media
        #   items are to be removed from.
        # @param [Google::Apis::PhotoslibraryV1::BatchRemoveMediaItemsFromAlbumRequest] batch_remove_media_items_from_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::BatchRemoveMediaItemsFromAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::BatchRemoveMediaItemsFromAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_remove_media_items_from_album(album_id, batch_remove_media_items_from_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/albums/{+albumId}:batchRemoveMediaItems', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::BatchRemoveMediaItemsFromAlbumRequest::Representation
          command.request_object = batch_remove_media_items_from_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::BatchRemoveMediaItemsFromAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::BatchRemoveMediaItemsFromAlbumResponse
          command.params['albumId'] = album_id unless album_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates an album in a user's Google Photos library.
        # @param [Google::Apis::PhotoslibraryV1::CreateAlbumRequest] create_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::Album] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::Album]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def create_album(create_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/albums', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::CreateAlbumRequest::Representation
          command.request_object = create_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::Album::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::Album
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the album based on the specified `albumId`.
        # The `albumId` must be the ID of an album owned by the user or a shared
        # album that the user has joined.
        # @param [String] album_id
        #   Identifier of the album to be requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::Album] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::Album]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_album(album_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/albums/{+albumId}', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::Album::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::Album
          command.params['albumId'] = album_id unless album_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all albums shown to a user in the Albums tab of the Google
        # Photos app.
        # @param [Boolean] exclude_non_app_created_data
        #   If set, the results exclude media items that were not created by this app.
        #   Defaults to false (all albums are returned). This field is ignored if the
        #   photoslibrary.readonly.appcreateddata scope is used.
        # @param [Fixnum] page_size
        #   Maximum number of albums to return in the response. Fewer albums might be
        #   returned than the specified number. The default `pageSize` is 20, the
        #   maximum is 50.
        # @param [String] page_token
        #   A continuation token to get the next page of the results. Adding this to
        #   the request returns the rows after the `pageToken`. The `pageToken` should
        #   be the value returned in the `nextPageToken` parameter in the response to
        #   the `listAlbums` request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::ListAlbumsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::ListAlbumsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_albums(exclude_non_app_created_data: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/albums', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::ListAlbumsResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::ListAlbumsResponse
          command.query['excludeNonAppCreatedData'] = exclude_non_app_created_data unless exclude_non_app_created_data.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks an album as shared and accessible to other users. This action can
        # only be performed on albums which were created by the developer via the
        # API.
        # @param [String] album_id
        #   Identifier of the album to be shared. This `albumId` must belong to an
        #   album created by the developer.
        # @param [Google::Apis::PhotoslibraryV1::ShareAlbumRequest] share_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::ShareAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::ShareAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def share_album(album_id, share_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/albums/{+albumId}:share', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::ShareAlbumRequest::Representation
          command.request_object = share_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::ShareAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::ShareAlbumResponse
          command.params['albumId'] = album_id unless album_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Marks a previously shared album as private. This means that the album is
        # no longer shared and all the non-owners will lose access to the album. All
        # non-owner content will be removed from the album. If a non-owner has
        # previously added the album to their library, they will retain all photos in
        # their library. This action can only be performed on albums which were
        # created by the developer via the API.
        # @param [String] album_id
        #   Identifier of the album to be unshared. This album id must belong to an
        #   album created by the developer.
        # @param [Google::Apis::PhotoslibraryV1::UnshareAlbumRequest] unshare_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::UnshareAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::UnshareAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def unshare_album(album_id, unshare_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/albums/{+albumId}:unshare', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::UnshareAlbumRequest::Representation
          command.request_object = unshare_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::UnshareAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::UnshareAlbumResponse
          command.params['albumId'] = album_id unless album_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Creates one or more media items in a user's Google Photos library.
        # This is the second step for creating a media item. For details regarding
        # Step 1, uploading the raw bytes to a Google Server, see
        # <a href="/photos/library/guides/upload-media">Uploading media</a>.
        # This call adds the media item to the library. If an album `id` is
        # specified, the call adds the media item to the album too. Each album can
        # contain up to 20,000 media items. By default, the media item will be added
        # to the end of the library or album.
        # If an album `id` and position are both defined, the media item is
        # added to the album at the specified position.
        # If the call contains multiple media items, they're added at the specified
        # position.
        # If you are creating a media item in a shared album where you are not the
        # owner, you are not allowed to position the media item. Doing so will result
        # in a `BAD REQUEST` error.
        # @param [Google::Apis::PhotoslibraryV1::BatchCreateMediaItemsRequest] batch_create_media_items_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::BatchCreateMediaItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::BatchCreateMediaItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_create_media_items(batch_create_media_items_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/mediaItems:batchCreate', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::BatchCreateMediaItemsRequest::Representation
          command.request_object = batch_create_media_items_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::BatchCreateMediaItemsResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::BatchCreateMediaItemsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the list of media items for the specified media item identifiers.
        # Items are returned in the same order as the supplied identifiers.
        # @param [Array<String>, String] media_item_ids
        #   Identifiers of the media items to be requested.
        #   Must not contain repeated identifiers and cannot be empty. The maximum
        #   number of media items that can be retrieved in one call is 50.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::BatchGetMediaItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::BatchGetMediaItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def batch_media_item_get(media_item_ids: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/mediaItems:batchGet', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::BatchGetMediaItemsResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::BatchGetMediaItemsResponse
          command.query['mediaItemIds'] = media_item_ids unless media_item_ids.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the media item for the specified media item identifier.
        # @param [String] media_item_id
        #   Identifier of the media item to be requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::MediaItem] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::MediaItem]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_media_item(media_item_id, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/mediaItems/{+mediaItemId}', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::MediaItem::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::MediaItem
          command.params['mediaItemId'] = media_item_id unless media_item_id.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # List all media items from a user's Google Photos library.
        # @param [Fixnum] page_size
        #   Maximum number of media items to return in the response. Fewer media items
        #   might be returned than the specified number. The default `pageSize` is 25,
        #   the maximum is 100.
        # @param [String] page_token
        #   A continuation token to get the next page of the results. Adding this to
        #   the request returns the rows after the `pageToken`. The `pageToken` should
        #   be the value returned in the `nextPageToken` parameter in the response to
        #   the `listMediaItems` request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::ListMediaItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::ListMediaItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_media_items(page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/mediaItems', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::ListMediaItemsResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::ListMediaItemsResponse
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Searches for media items in a user's Google Photos library.
        # If no filters are set, then all media items in the user's library are
        # returned.
        # If an album is set, all media items in the specified album are returned.
        # If filters are specified, media items that match the filters from the
        # user's library are listed. If you set both the album and the filters, the
        # request results in an error.
        # @param [Google::Apis::PhotoslibraryV1::SearchMediaItemsRequest] search_media_items_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::SearchMediaItemsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::SearchMediaItemsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def search_media_items(search_media_items_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/mediaItems:search', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::SearchMediaItemsRequest::Representation
          command.request_object = search_media_items_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::SearchMediaItemsResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::SearchMediaItemsResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Returns the album based on the specified `shareToken`.
        # @param [String] share_token
        #   Share token of the album to be requested.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::Album] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::Album]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def get_shared_album(share_token, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/sharedAlbums/{+shareToken}', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::Album::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::Album
          command.params['shareToken'] = share_token unless share_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Joins a shared album on behalf of the Google Photos user.
        # @param [Google::Apis::PhotoslibraryV1::JoinSharedAlbumRequest] join_shared_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::JoinSharedAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::JoinSharedAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def join_shared_album(join_shared_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/sharedAlbums:join', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::JoinSharedAlbumRequest::Representation
          command.request_object = join_shared_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::JoinSharedAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::JoinSharedAlbumResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Leaves a previously-joined shared album on behalf of the Google Photos
        # user. The user must not own this album.
        # @param [Google::Apis::PhotoslibraryV1::LeaveSharedAlbumRequest] leave_shared_album_request_object
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::LeaveSharedAlbumResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::LeaveSharedAlbumResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def leave_shared_album(leave_shared_album_request_object = nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:post, 'v1/sharedAlbums:leave', options)
          command.request_representation = Google::Apis::PhotoslibraryV1::LeaveSharedAlbumRequest::Representation
          command.request_object = leave_shared_album_request_object
          command.response_representation = Google::Apis::PhotoslibraryV1::LeaveSharedAlbumResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::LeaveSharedAlbumResponse
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end
        
        # Lists all shared albums available in the Sharing tab of the
        # user's Google Photos app.
        # @param [Boolean] exclude_non_app_created_data
        #   If set, the results exclude media items that were not created by this app.
        #   Defaults to false (all albums are returned). This field is ignored if the
        #   photoslibrary.readonly.appcreateddata scope is used.
        # @param [Fixnum] page_size
        #   Maximum number of albums to return in the response. Fewer albums might be
        #   returned than the specified number. The default `pageSize` is 20, the
        #   maximum is 50.
        # @param [String] page_token
        #   A continuation token to get the next page of the results. Adding this to
        #   the request returns the rows after the `pageToken`. The `pageToken` should
        #   be the value returned in the `nextPageToken` parameter in the response to
        #   the `listSharedAlbums` request.
        # @param [String] fields
        #   Selector specifying which fields to include in a partial response.
        # @param [String] quota_user
        #   Available to use for quota purposes for server-side applications. Can be any
        #   arbitrary string assigned to a user, but should not exceed 40 characters.
        # @param [Google::Apis::RequestOptions] options
        #   Request-specific options
        #
        # @yield [result, err] Result & error if block supplied
        # @yieldparam result [Google::Apis::PhotoslibraryV1::ListSharedAlbumsResponse] parsed result object
        # @yieldparam err [StandardError] error object if request failed
        #
        # @return [Google::Apis::PhotoslibraryV1::ListSharedAlbumsResponse]
        #
        # @raise [Google::Apis::ServerError] An error occurred on the server and the request can be retried
        # @raise [Google::Apis::ClientError] The request is invalid and should not be retried without modification
        # @raise [Google::Apis::AuthorizationError] Authorization is required
        def list_shared_albums(exclude_non_app_created_data: nil, page_size: nil, page_token: nil, fields: nil, quota_user: nil, options: nil, &block)
          command = make_simple_command(:get, 'v1/sharedAlbums', options)
          command.response_representation = Google::Apis::PhotoslibraryV1::ListSharedAlbumsResponse::Representation
          command.response_class = Google::Apis::PhotoslibraryV1::ListSharedAlbumsResponse
          command.query['excludeNonAppCreatedData'] = exclude_non_app_created_data unless exclude_non_app_created_data.nil?
          command.query['pageSize'] = page_size unless page_size.nil?
          command.query['pageToken'] = page_token unless page_token.nil?
          command.query['fields'] = fields unless fields.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
          execute_or_queue_command(command, &block)
        end

        protected

        def apply_command_defaults(command)
          command.query['key'] = key unless key.nil?
          command.query['quotaUser'] = quota_user unless quota_user.nil?
        end
      end
    end
  end
end
