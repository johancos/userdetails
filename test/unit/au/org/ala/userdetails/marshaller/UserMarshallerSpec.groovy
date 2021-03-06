package au.org.ala.userdetails.marshaller

import au.org.ala.userdetails.*
import grails.converters.JSON
import grails.test.mixin.Mock

/**
 * Tests the UserMarshaller
 */
@Mock([User, Role, UserRole, UserProperty])
class UserMarshallerSpec extends UserDetailsSpec {

    private User user

    void setup() {

        user = createUser()
    }

    void "JSON serialization of the User object should be output in a specific format"() {
        when:
        registerMarshallers()
        User user = createUser()
        def expectedSerializedProperies = ['userId', 'userName', 'firstName', 'lastName', 'email', 'roles']
        JSON json = user as JSON
        Map deserializedJson = JSON.parse(json.toString())

        then:
        deserializedJson.size() == expectedSerializedProperies.size()
        deserializedJson.userId == Long.toString(user.id)
        deserializedJson.userName == user.userName

        deserializedJson.firstName == user.firstName
        deserializedJson.lastName == user.lastName
        deserializedJson.email == user.email
        deserializedJson.roles == ['ROLE_USER']

    }

    void "There should be a named JSON configuration that allows the properties of a User to be included in the serialized user data"() {
        when:
        JSON json
        User user = createUser()
        registerMarshallers()

        def expectedSerializedProperties = ['userId', 'userName', 'firstName', 'lastName', 'email', 'roles', 'props']

        JSON.use(UserMarshaller.WITH_PROPERTIES_CONFIG) {
            json = user as JSON
        }
        Map deserializedJson = JSON.parse(json.toString())

        then:
        deserializedJson.size() == expectedSerializedProperties.size()
        deserializedJson.userId == Long.toString(user.id)
        deserializedJson.userName == user.userName

        deserializedJson.firstName == user.firstName
        deserializedJson.lastName == user.lastName
        deserializedJson.email == user.email
        deserializedJson.roles == ['ROLE_USER']
        deserializedJson.props == [prop1:'prop1', prop2:'prop2']
    }



}
